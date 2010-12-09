--
-- GetNumRecords(): Returns the number of log records.
--
-- GetLogRecord(i): Returns the ith log record starting 0.
--
-- ExportLog(): Returns a string with the data of the exported log for
-- import into the web application.
--
-- UndoLastAction(): Removes the last entry from the log and undoes
-- its action. The undone action is not logged.
--
-- This module also fires the following messages.
--
-- LogChanged(n): Fired when the log is changed. n is the new size of
-- the log.
--

local mod = EPGP:NewModule("log", "AceComm-3.0")

local L = LibStub:GetLibrary("AceLocale-3.0"):GetLocale("EPGP")
local JSON = LibStub("LibJSON-1.0")
local deformat = LibStub("LibDeformat-3.0")
local Debug = LibStub("LibDebug-1.0")

local CallbackHandler = LibStub("CallbackHandler-1.0")
if not mod.callbacks then
  mod.callbacks = CallbackHandler:New(mod)
end
local callbacks = mod.callbacks

local GetTimestamp = EPGP.GetTimestamp

local LOG_FORMAT = "LOG:%d\31%s\31%s\31%s\31%d"

local function AppendToLog(...)
  -- Clear the redo table
  for k,_ in ipairs(mod.db.profile.redo) do
    mod.db.profile.redo[k] = nil
  end
  local entry = {GetTimestamp(), ...}
  table.insert(mod.db.profile.log, entry)
  callbacks:Fire("LogChanged", #mod.db.profile.log)
end

local function LogRecordToString(timestamp, kind, ...)
  local nice_timestamp = date("%Y-%m-%d %H:%M", timestamp)
  local formatted_record
  if kind == EPGP.DECAY_REQUEST then
    formatted_record = EPGP.FormatDecayRequest(...)
  elseif kind == EPGP.CHANGE_REQUEST then
    formatted_record = EPGP.FormatChangeRequest(...)
  else
    -- These are wotlk-structured entries
    local name, reason, amount = ...
    if kind == "EP" then
      formatted_record = L["%+d EP (%s) to %s"]:format(amount, reason, name)
    elseif kind == "GP" then
      formatted_record = L["%+d GP (%s) to %s"]:format(amount, reason, name)
    elseif kind == "BI" then
      formatted_record = L["%s to %s"]:format(reason, name)
    else
      formatted_record = L["(corrupt/malformed log entry)"]
    end
  end
  return nice_timestamp..": "..formatted_record
end

function mod:GetNumRecords()
  return #self.db.profile.log
end

function mod:GetLogRecord(i)
  local logsize = #self.db.profile.log
  assert(i >= 0 and i < #self.db.profile.log, "Index "..i.." is out of bounds")

  return LogRecordToString(unpack(self.db.profile.log[logsize - i]))
end

function mod:CanUndo()
  if not CanEditOfficerNote() then
    return false
  end
  return #self.db.profile.log ~= 0
end

function mod:UndoLastAction()
  assert(#self.db.profile.log ~= 0)
  assert(false, "this doesn't work yet")

  local record = table.remove(self.db.profile.log)
  table.insert(self.db.profile.redo, record)

  local timestamp, kind, name, reason, amount = unpack(record)

  local ep, gp, main = EPGP:GetEPGP(name)

  if kind == "EP" then
    EPGP:IncEPBy(name, L["Undo"].." "..reason, -amount, false, true)
  elseif kind == "GP" then
    EPGP:IncGPBy(name, L["Undo"].." "..reason, -amount, false, true)
  elseif kind == "BI" then
    EPGP:BankItem(L["Undo"].." "..reason, true)
  else
    assert(false, "Unknown record in the log")
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
  return true
end

function mod:CanRedo()
  if not CanEditOfficerNote() then
    return false
  end

  return #self.db.profile.redo ~= 0
end

function mod:RedoLastUndo()
  assert(#self.db.profile.redo ~= 0)
  assert(false, "this doesn't work yet")

  local record = table.remove(self.db.profile.redo)
  local timestamp, kind, name, reason, amount = unpack(record)

  local ep, gp, main = EPGP:GetEPGP(name)
  if kind == "EP" then
    EPGP:IncEPBy(name, L["Redo"].." "..reason, amount, false, true)
    table.insert(self.db.profile.log, record)
  elseif kind == "GP" then
    EPGP:IncGPBy(name, L["Redo"].." "..reason, amount, false, true)
    table.insert(self.db.profile.log, record)
  else
    assert(false, "Unknown record in the log")
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
  return true
end

-- This is kept for historical reasons: see
-- http://code.google.com/p/epgp/issues/detail?id=350.
function mod:Snapshot()
  local t = self.db.profile.snapshot
  if not t then
    t = {}
    self.db.profile.snapshot = t
  end
  t.time = GetTimestamp()
  -- GS:Snapshot(t)
end

local function swap(t, i, j)
  t[i], t[j] = t[j], t[i]
end

local function reverse(t)
  for i=1,math.floor(#t / 2) do
    swap(t, i, #t - i + 1)
  end
end

function mod:TrimToOneMonth()
  -- The log is sorted in reverse timestamp. We do not want to remove
  -- one item at a time since this will result in O(n^2) time. So we
  -- build it anew.
  local new_log = {}
  local last_timestamp = GetTimestamp({ month = -1 })

  -- Go through the log in reverse order and stop when we reach an
  -- entry older than one month.
  for i=#self.db.profile.log,1,-1 do
    local record = self.db.profile.log[i]
    if record[1] < last_timestamp then
      break
    end
    table.insert(new_log, record)
  end

  -- The new log is in reverse order now so reverse it.
  reverse(new_log)

  self.db.profile.log = new_log

  callbacks:Fire("LogChanged", #self.db.profile.log)
end

function mod:ExportRoster()
  local base_gp = EPGP:GetBaseGP()
  local t = {}
  local totalMembers = GetNumGuildMembers()
  for i=1,totalMembers do
    local name = GetGuildRosterInfo(i)
    local info = EPGP:GetMemberInfo(name)

    local ep, gp, main = info.GetEP(), info.GetGP(), info.GetMain()
    if ep ~= 0 or gp ~= base_gp then
      table.insert(t, {name, ep, gp})
    end
  end
  return t
end

function mod:Export()
  local d = {}
  d.region = GetCVar("portal")
  d.guild = select(1, GetGuildInfo("player"))
  d.realm = GetRealmName()
  d.base_gp = EPGP:GetBaseGP()
  d.min_ep = EPGP:GetMinEP()
  d.decay_p = EPGP:GetDecayPercent()
  d.extras_p = EPGP:GetExtrasPercent()
  d.timestamp = GetTimestamp()

  d.roster = mod:ExportRoster()

  d.loot = {}
  for i=1, #self.db.profile.log do
    local record = self.db.profile.log[i]
    local changer, _, reason, delta_ep, delta_gp = unpack(record)
    local victim_string = strjoin(", ", select(6, unpack(record)))
    local timestamp, kind, changer, change_id, reason, delta_ep, delta_gp = unpack(record)
    if kind == EPGP.CHANGE_REQUEST and delta_gp ~= 0 then
      local id = tonumber(reason:match("item:(%d+)"))
      if id then
	-- GP should only be awarded to one person per record entry,
	-- but it's possible for there to be multiple.
	local victims = {unpack(record, 8)}
	for victim=1,#victims do
	  table.insert(d.loot, {timestamp, victims[victim], id, delta_gp})
	end
      end
    end
  end

  return JSON.Serialize(d):gsub("\124", "\124\124")
end

function mod:Import(jsonStr)
  local success, d = pcall(JSON.Deserialize, jsonStr)
  if not success then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  if d.region and d.region ~= GetCVar("portal") then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  if d.guild ~= select(1, GetGuildInfo("player")) or
     d.realm ~= GetRealmName() then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  local types = {
    timestamp = "number",
    roster = "table",
    decay_p = "number",
    extras_p = "number",
    min_ep = "number",
    base_gp = "number",
  }
  for k,t in pairs(types) do
    if type(d[k]) ~= t then
      EPGP:Print(L["The imported data is invalid"])
      return
    end
  end

  for _, entry in pairs(d.roster) do
    if type(entry) ~= "table" then
      EPGP:Print(L["The imported data is invalid"])
      return
    else
      local types = {
        [1] = "string",
        [2] = "number",
        [3] = "number",
      }
      for k,t in pairs(types) do
        if type(entry[k]) ~= t then
          EPGP:Print(L["The imported data is invalid"])
          return
        end
      end
    end
  end

  EPGP:Print(L["Importing data snapshot taken at: %s"]:format(
               date("%Y-%m-%d %H:%M", d.timestamp)))
  EPGP:SetGlobalConfiguration(d.decay_p, d.extras_p, d.base_gp, d.min_ep)
  EPGP:ImportRoster(d.roster, d.base_gp)

  -- Trim the log if necessary.
  local timestamp = d.timestamp
  while true do
    local records = #self.db.profile.log
    if records == 0 then
      break
    end

    if self.db.profile.log[records][1] > timestamp then
      table.remove(self.db.profile.log)
    else
      break
    end
  end
  -- Add the redos back to the log if necessary.
  while #self.db.profile.redo ~= 0 do
    local record = table.remove(self.db.profile.redo)
    if record[1] < timestamp then
      table.insert(self.db.profile.log, record)
    end
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
end

mod.dbDefaults = {
  profile = {
    enabled = true,
    log = {},
    redo = {},
  }
}

function mod:OnModuleEnable()
  EPGP:GetModule("slave").RegisterMessage(self, EPGP.CHANGE_REQUEST,
                                          AppendToLog)
  EPGP:GetModule("slave").RegisterMessage(self, EPGP.DECAY_REQUEST, AppendToLog)

  -- Upgrade the logs from older dbs
  if EPGP.db.profile.log then
    self.db.profile.log = EPGP.db.profile.log
    EPGP.db.profile.log = nil
  end
  if EPGP.db.profile.redo then
    self.db.profile.redo = EPGP.db.profile.redo
    EPGP.db.profile.redo = nil
  end

  -- This is kept for historical reasons. See:
  -- http://code.google.com/p/epgp/issues/detail?id=350.
  EPGP.db.RegisterCallback(self, "OnDatabaseShutdown", "Snapshot")
end

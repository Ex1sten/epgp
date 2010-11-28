local mod = EPGP:NewModule("gptooltip", "AceHook-3.0")

local GP = LibStub("LibGearPoints-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")

local SLOT_LABELS = {
  INVTYPE_RANGED = { LOCALIZED_CLASS_NAMES_MALE["HUNTER"], OTHER },
  INVTYPE_SHIELD = { TANK, OTHER },
  INVTYPE_2HWEAPON = { OTHER, LOCALIZED_CLASS_NAMES_MALE["HUNTER"] },
  INVTYPE_RANGEDRIGHT = { LOCALIZED_CLASS_NAMES_MALE["HUNTER"], OTHER },
  INVTYPE_WEAPON = { OTHER, TANK },
}

function OnTooltipSetItem(tooltip, ...)
  local _, itemlink = tooltip:GetItem()
  if not itemlink then return end
  local gp1, gp2, ilvl = GP:GetValue(itemlink)
  local _, _, _, _, _, _, _, _, equip_loc = GetItemInfo(itemlink)
  local labels = SLOT_LABELS[equip_loc]

  if gp1 then
    if gp2 then
      if #labels == 2 then
	tooltip:AddLine(
	  L["GP: %d (%s) or %d (%s)"]:format(gp1, labels[1], gp2, labels[2]),
	  NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
      else
	tooltip:AddLine(
	  L["GP: %d or %d"]:format(gp1, gp2),
	  NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
      end
    else
      tooltip:AddLine(
        L["GP: %d"]:format(gp1),
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
    end
  end
end

mod.dbDefaults = {
  profile = {
    enabled = true,
    threshold = 4, -- Epic
  }
}

mod.optionsName = L["Tooltip"]
mod.optionsDesc = L["GP on tooltips"]
mod.optionsArgs = {
  help = {
    order = 1,
    type = "description",
    name = L["Provide a proposed GP value of armor on tooltips. Quest items or tokens that can be traded for armor will also have a proposed GP value."],
  },
  threshold = {
    order = 10,
    type = "select",
    name = L["Quality threshold"],
    desc = L["Only display GP values for items at or above this quality."],
    values = {
      [0] = ITEM_QUALITY0_DESC, -- Poor
      [1] = ITEM_QUALITY1_DESC, -- Common
      [2] = ITEM_QUALITY2_DESC, -- Uncommon
      [3] = ITEM_QUALITY3_DESC, -- Rare
      [4] = ITEM_QUALITY4_DESC, -- Epic
      [5] = ITEM_QUALITY5_DESC, -- Legendary
      [6] = ITEM_QUALITY6_DESC, -- Artifact
    },
    get = function() return GP:GetQualityThreshold() end,
    set = function(info, itemQuality)
      info.handler.db.profile.threshold = itemQuality
      GP:SetQualityThreshold(itemQuality)
    end,
  },
}

function mod:OnModuleEnable()
  GP:SetQualityThreshold(self.db.profile.threshold)

  local obj = EnumerateFrames()
  while obj do
    if obj:IsObjectType("GameTooltip") then
      assert(obj:HasScript("OnTooltipSetItem"))
      self:HookScript(obj, "OnTooltipSetItem", OnTooltipSetItem)
    end
    obj = EnumerateFrames(obj)
  end
end

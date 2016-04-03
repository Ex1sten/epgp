# Introduction #

These is a very draft design document for the EPGP v5 addon. Requirements:

  * Scale to guilds with more than a couple of hundred members
  * Have a more user friendly interface for standby EPs ([Issue 126](http://code.google.com/p/epgp/issues/detail?id=126))
  * Keep logs on a per client basis and provide a way to export these to a web application (effectively fixing [Issue 85](http://code.google.com/p/epgp/issues/detail?id=85))
  * Support alts in the same way the current system does
  * ~~Support out of guild members (possibly a bit better)~~ - This is getting a lot harder with the web application in mind. Maybe at a later point.
  * Auto GP credit popup - only out of combat, with a queue ([Issue 181](http://code.google.com/p/epgp/issues/detail?id=181))
  * Properly assign GPs to weapons/shields/wands/bows/thrown (for more info check [Issue 72](http://code.google.com/p/epgp/issues/detail?id=72))

Optional nice to have features:

  * Report to a custom channel ([Issue 109](http://code.google.com/p/epgp/issues/detail?id=109))
  * Exclude items from GP awards ([Issue 198](http://code.google.com/p/epgp/issues/detail?id=198))
  * Winner selection from need/offspec on items ([Issue 101](http://code.google.com/p/epgp/issues/detail?id=101), [Issue 104](http://code.google.com/p/epgp/issues/detail?id=104))
  * Ability to disable some ranks from EP/GP alltogether ([Issue 183](http://code.google.com/p/epgp/issues/detail?id=183))
  * Add all options to addon options in the Blizzard UI and have the addon "edit" Guild Info to store its global guildwide settings

# Details #

## Libraries ##

### Ace3 ###

The addon and its libraries will be based on Ace3.

### LibGuildNoteStorage ###

This library should be a stripped down version of what Cache.lua is
today. It should only support efficient reads and writes to officer
notes and guild info. Efficiency is key here in order to make the
addon scale for guilds with more than 100 or so members.

The interface:

```
lib:GetGuildInfo()

lib:GetNote(name)

lib:SetNote(name, note)
```

The library also fires callbacks on changes to make updating a lot
simpler for the core addon.

The callbacks:

```
GuildInfoChanged(info)

GuildNoteChanged(name, note)
```

Behind the scenes the library will continuously query the guild
information and cache the values. The scans should be broken in chunks
and executed in an OnUpdate script so that the UI doesn't freeze
for people in large guilds. Writes should happen based on a cached index so a raid award will trigger at most 40 GuildRosterSetOfficerNote calls.

## The core addon ##
### EPGP ###

This will be the core of the addon. It should implement all the
alt/outsider logic, know how to add EP/GP to people and provide sorted
iterators to the EPGP listing. It should look more or less like
Backend.lua but without the UI code. In addition the core should
provide logging capabilities by supporting import/export for a history
log.

The interface:

```
lib:GetIter(sortName)

lib:ResetEPGP()

lib:DecayEPGP()

lib:IncEPBy(name, reason, amount)

lib:IncGPBy(name, reason, amount)

lib:GetEPGP(name)

lib:ExportLog()

lib:ImportLog(log)

lib:GetDecayPercent()
lib:GetBaseGP()
lib:GetMinEP()
```

Awards to raid and/or standby will involve the addon making multiple
calls to the IncEPBy API for example instead of providing an
AddEPToRaid API. Similarly for DecayEPGP. The reason decay is going to
be implemented in terms of IncEPBy and IncGPBy is to enable simple
undo from the saved logs. If the log contains increments and
decreaments of EP and GP you can always compute back to the original
value without ever storing it. If you allow setting EP or GP directly
at each point you need to backup the old value in order to allow a
rollback.

The ImportLog API should be able to take an exported log from the
website and incorporate it in the local client. The client should not
attempt to sync the log with other clients in the guild.

The ExportLog API should also be as simple as possible. It will be a
dump of **all** the current state of the log plus the current state of EPGP
(for syncing verification). The webapp should do the smarts and figure
out what is new and what is old and pick the events it really needs to
keep the logs up to date.

The log should also allow infinite rollback. Only the top action in
the log can be rolled back, but that should be enough to let you roll
all the way back to the original state **granted you have the complete
logs**.

## The log format ##

The log will be a list of log records. There are 3 kinds of log records:

```
EP
GP
RESET
```

Each log record will be a tuple of the form:

`<timestamp,type,source,target,reason[,amount]>`

The definition of each field is as follows:

| **field** | **definition** |
|:----------|:---------------|
| timestamp | The timestamp of this change |
| type      | The type of this record. One of EP, GP, RESET. |
| source    | The person making this change |
| target    | The person whose EP or GP are being changed |
| reason    | The reason for the change |
| amount    | This is the change to the previous value of EP or GP (depending on the type) |

Examples:

Disht awards 3500 recurring EP to Thisbe for Sunwell Plateu
attendance:
```
123, EP, Disht, Thisbe, Sunwell Plateau, 3500
```

Disht credits 495 GP to Attackfisk for Onslaught Breastplate:
```
456, GP, Disht, Attackfisk, Sunwell Plateau, 495
```

Attackfisk performs a decay at the end of raid with decay set to
10%. Thisbe the member in question had 20000 EP and 672 GP to start
with. This will generate two log records:
```
789, EP, Attackfisk, Thisbe, Decay 10%, -2000
789, GP, Attackfisk, Thisbe, Decay 10%, -67
```

Disht performs an EPGP reset.
```
890, RESET, Disht, Disht, Reset for Tier 8
890, RESET, Disht, Thisbe, Reset for Tier 8
890, RESET, Disht, Attackfisk, Reset for Tier 8
```

A full log export will start with the dump of all EP and GP, followed by alts definition, followed by the log contents, separated by `---`:

```
# Name, EP, GP
Disht, 100, 200
---
# Name, Main
Aphozoid, Disht
---
123, EP, Attackfisk, Disht, Decay 10%, -10
123, EP, Attackfisk, Attackfisk, Decay 10%, -20
```

TODO: Need to add changes to MIN\_EP, BASE\_GP and DECAY\_P to the logs.

## The UI ##

The UI is in dire need of a revamp:

  * The listing should not be broken in a raid and guild mode. It would be much much simpler if it was just one, where all the members not in the raid are faded out.
  * The main panel should not have an options tab. Options should go in the Blizzard Addon options panel inside the main options.
  * There also needs to be a better way to enter item links as reasons for GP credits.
  * Import/Export should be removed completely. With a webapp backing this up there is absolutely no need for this cruft.
  * ImportLog/ExportLog should go in another tab, where the log is viewable. The log viewer should be dead simple, just a list of awards. People should really be going to the website for more detailed analysis.
  * Standby members can be implemented with a checkbox next to each name. Those in the raid get this checkbox ticked automatically, and everyone else doesn't. The EPGP master will just tick off those on the standby list to get them in it.
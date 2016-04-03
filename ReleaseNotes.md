### 5.7.2 - November 29 2011 ###
  * Dragon Soul is here!  See DragonSoulReleaseNotes

### 5.6.0 - June 28 2011 ###
  * Firelands is here!  See FirelandsReleaseNotes

### 5.5.27 - May 3rd 2011 ###
  * Update included libraries to latest upstream versions
  * Fix guild storage traceback

### 5.5.25 - Jan 16th ###
  * Fix library include order
    * http://code.google.com/p/epgp/issues/detail?id=683

### 5.5.24 - Dec 21st ###
  * Fix decay not working bug
    * http://code.google.com/p/epgp/issues/detail?id=668
  * Update EP reasons to Cataclysm raids
  * Fix GP formula to give 1000 for ilvl 359 chest
    * http://code.google.com/p/epgp/issues/detail?id=669hg

### 5.5.23 - Dec 16th ###
  * Update GP formula for cataclysm

### 5.5.22 - Oct 14th ###
  * Fixes slow refresh when show offline members is checked off in guild UI
    * http://code.google.com/p/epgp/issues/detail?id=632

### 5.5.20 - Oct 13th ###
  * Fixes for 4.0.1 patch
    * http://code.google.com/p/epgp/issues/detail?id=630

### 5.5.19 - Aug 2nd ###
  * Add DXE support
    * http://code.google.com/p/epgp/issues/detail?id=546
  * Use ChatThrottleLib for LibGuildStorage events

### 5.5.18 - Jul 26th ###
  * Fix bug with 3.3.5 style chat frames
    * http://code.google.com/p/epgp/issues/detail?id=606
  * Guard decay/reset EPGP from unauthorized members
    * http://code.google.com/p/epgp/issues/detail?id=614

### 5.5.17 - Jul 1st ###
  * Update localizations
  * Update libs

### 5.5.16 - Mar 31st ###
  * Fix popup bug
  * Update localizations

### 5.5.15 - Feb 7th ###
  * Ignore emblems of Frost
    * http://code.google.com/p/epgp/issues/detail?id=579
  * Update localizations

### 5.5.14 - Dec 30th ###
  * Update the TOC
    * http://code.google.com/p/epgp/issues/detail?id=549
  * Fix raid dungeon names after heroic/normal 10/25 was made orthogonal
    * http://code.google.com/p/epgp/issues/detail?id=563
  * Remove alts from the waiting list after an award (same as mains)
    * http://code.google.com/p/epgp/issues/detail?id=540
  * Update localizations

### 5.5.13 - Dec 8th ###
  * Fix ui error on 3.3
    * http://code.google.com/p/epgp/issues/detail?id=548

### 5.5.12 - Dec 6th ###
  * Add support for %t in epgp slash commands
    * http://code.google.com/p/epgp/issues/detail?id=543
  * Fix LDB which broke after the introduction of the new slash commands
    * http://code.google.com/p/epgp/issues/detail?id=544

### 5.5.11 - Dec 4th ###
  * Add command line interface
    * http://code.google.com/p/epgp/issues/detail?id=329
  * Add GP for Marks of Sanctification and Trophies of the Crusade
    * http://code.google.com/p/epgp/issues/detail?id=542
  * Update localizations

### 5.5.10 - Nov 6th ###
  * Fix error when displaying multiple admin warning
    * http://code.google.com/p/epgp/issues/detail?id=530
  * Update localizations

### 5.5.9 - Nov 2nd ###
  * Document data corruption/loss when multiple people change EPGP at the same time
    * http://code.google.com/p/epgp/issues/detail?id=512
  * Fix typo in BigWigs integration
  * Updated localizations

### 5.5.8 - Oct 30th ###
  * Add LDB module to EPGP
    * http://code.google.com/p/epgp/issues/detail?id=491
  * Fix overlap of trim button in the log window
    * http://code.google.com/p/epgp/issues/detail?id=471
  * Support BigWigs for boss kill/wipe detection
    * http://code.google.com/p/epgp/issues/detail?id=454

### 5.5.7 - Sep 21st ###
  * Fix problem with Mass EP awards
    * http://code.google.com/p/epgp/issues/detail?id=518

### 5.5.6 - Sep 19th ###
  * Fix weird errors when alts create a cycle (i.e. A is an alt of B and B is an alt of A)
    * http://code.google.com/p/epgp/issues/detail?id=507
  * Do not fail mass EP awards when non-guildies are in the raid
    * http://code.google.com/p/epgp/issues/detail?id=517
  * Fix boss kill/wipe detection with DBM after DBM API change
    * http://code.google.com/p/epgp/issues/detail?id=513

### 5.5.5 - Aug 25th ###
  * Added some more debugging information in the debug log to aid
> > debugging some weird interactions some people are seeing
    * http://code.google.com/p/epgp/issues/detail?id=459
  * Updated localizations

### 5.5.4 - Aug 9th ###
  * Messed up archive, repackaged.

### 5.5.3 - Aug 9th ###
  * Fix issues with ChatThrottleLib 21
    * http://code.google.com/p/epgp/issues/detail?id=489
  * Fix Algalon Quest rewards
    * http://code.google.com/p/epgp/issues/detail?id=486

### 5.5.2 - Aug 6th ###
  * Disable input of fractional EP or GP
    * http://code.google.com/p/epgp/issues/detail?id=479
  * Personal log is synced to guild members when they are online
    * http://code.google.com/p/epgp/issues/detail?id=485
  * Remove ilvl from tooltip since it is now in the default ui
    * http://code.google.com/p/epgp/issues/detail?id=484
  * Ignore emblems of triumph
    * http://code.google.com/p/epgp/issues/detail?id=482
  * Add GP values for 25 man hard mode Coliseum tokens (regalia)
    * http://code.google.com/p/epgp/issues/detail?id=480
  * Choose where whisper instructions go
    * http://code.google.com/p/epgp/issues/detail?id=475
  * People on standby are not correctly removed from the standby list
    * http://code.google.com/p/epgp/issues/detail?id=476
  * Mass EP awards are given to both alt and main if both were in raid
    * http://code.google.com/p/epgp/issues/detail?id=474

### 5.5.1 - Aug 2nd ###
  * Fixed error when undoing 0 point EP or GP entries
    * http://code.google.com/p/epgp/issues/detail?id=439
  * Show member's rank in the standing's tooltip
    * http://code.google.com/p/epgp/issues/detail?id=429
  * Make whisper with name case insensitive as well
    * http://code.google.com/p/epgp/issues/detail?id=472
  * Make whisper back report the right amount of EP for standy members
    * http://code.google.com/p/epgp/issues/detail?id=461
  * Fixed issues with automatic boss EP awards
    * http://code.google.com/p/epgp/issues/detail?id=468
  * Fixed recurring award not being announced properly
    * http://code.google.com/p/epgp/issues/detail?id=466
  * Do not display GP credit dialog for members not in tracked by EPGP
    * http://code.google.com/p/epgp/issues/detail?id=465
  * Make wipe detection respect a disabled state
    * http://code.google.com/p/epgp/issues/detail?id=473

### 5.5 - Jul 30th ###
  * Fixed non-ascii localization in names whispered for standby
    * http://code.google.com/p/epgp/issues/detail?id=437
  * Standby awards are now properly announced to the designated channel
    * http://code.google.com/p/epgp/issues/detail?id=422
  * Add button to trim the personal log to entries in the last month only
    * http://code.google.com/p/epgp/issues/detail?id=458
  * Add button in the GP popup to mark items sent to guild bank
  * Add export of loot to www.epgpweb.com
    * http://code.google.com/p/epgp/issues/detail?id=395
  * Added wipe detection
    * http://code.google.com/p/epgp/issues/detail?id=457
  * Instructions on how to use the standby whisper feature are always sent to the guild channel
    * http://code.google.com/p/epgp/issues/detail?id=458
  * Added option to display GP popup depending on item quality
    * http://code.google.com/p/epgp/issues/detail?id=455
  * Standby whisper handling is now case-insensitive
    * http://code.google.com/p/epgp/issues/detail?id=453

### 5.4.12 - Jun 25th ###
  * Assigning loot but not assigning GP when target out of range
  * Fixed a bug where sometimes the looting messages were being duplicated by the patch. Also cleaned the code a bit for LibLootNotify.
    * http://code.google.com/p/epgp/issues/detail?id=427

### 5.4.11 - Jun 19th ###
  * Assigning loot but not assigning GP when target out of range
    * http://code.google.com/p/epgp/issues/detail?id=427
  * Fix tooltip scanning in LibItemUtils ClassCanUse()

### 5.4.10 - Jun 8th ###
  * Remove delay from automatic loot and boss award popups
    * http://code.google.com/p/epgp/issues/detail?id=320
  * Fix recurring EP award resume
    * http://code.google.com/p/epgp/issues/detail?id=289
  * Add information about epgpweb.com
    * http://code.google.com/p/epgp/issues/detail?id=431
  * Enable debugging output by default. /epgp debug toggles the debug window
    * http://code.google.com/p/epgp/issues/detail?id=432
  * Stop exporting the class of each toon in the export string
    * http://code.google.com/p/epgp/issues/detail?id=433
  * Fix recurring EP occasional stop after release and zone-in
    * http://code.google.com/p/epgp/issues/detail?id=425
  * Fix occasional disconnections during bosses on recurring EP ticks
    * http://code.google.com/p/epgp/issues/detail?id=420
  * Update localizations

### 5.4.9 - May 31st ###
  * Export region in the export string
  * Update localizations

### 5.4.8 - May 5th ###
  * Fix import to work again
    * http://code.google.com/p/epgp/issues/detail?id=415
  * Update localizations

### 5.4.7 - May 3rd ###
  * Use multiline editboxes for import/export instead of popups
    * http://code.google.com/p/epgp/issues/detail?id=356
  * Add Archivon Data Disk
    * http://code.google.com/p/epgp/issues/detail?id=412

### 5.4.6 - Apr 24th 2009 ###
  * Add Ulduar and Vault of Archavon bosses
    * http://code.google.com/p/epgp/issues/detail?id=408
  * Fix some options that were not persisting logouts
    * http://code.google.com/p/epgp/issues/detail?id=406
  * Fix error when zoning an instance while running recurring EP
    * http://code.google.com/p/epgp/issues/detail?id=389

### 5.4.5 - Apr 20th 2009 ###
  * Add T8 and T8 (heroic) token items
    * http://code.google.com/p/epgp/issues/detail?id=404

### 5.4.4 - Apr 17th 2009 ###
  * Fix wrong GP computation
    * http://code.google.com/p/epgp/issues/detail?id=400

### 5.4.3 - Apr 16th 2009 ###
  * Fix highlighting issue when selecting members for individual adjustments
    * http://code.google.com/p/epgp/issues/detail?id=383
  * Ignore and warn attemps to change EP or GP for an unknown member
    * http://code.google.com/p/epgp/issues/detail?id=384
  * Fix recurring award option poping up after a reboot
    * http://code.google.com/p/epgp/issues/detail?id=386
  * Fix multiple GuildRoster() calls on login
    * http://code.google.com/p/epgp/issues/detail?id=396
  * Ignore emblems of conquest
    * http://code.google.com/p/epgp/issues/detail?id=398
  * Log the right changes of EP/GP changes
    * http://code.google.com/p/epgp/issues/detail?id=380

### 5.4.2 - Apr 5th 2009 ###
  * Fix resizing of log frame to resize the strings in it as well
    * http://code.google.com/p/epgp/issues/detail?id=373
  * Fix problem with multibyte character export (korean, chinese)
    * http://code.google.com/p/epgp/issues/detail?id=378
  * Fix accept button on boss kill popup to update its state properly
    * http://code.google.com/p/epgp/issues/detail?id=376

### 5.4 - Apr 1st 2009 ###
  * Fix performance regression when updating mass EPGP (award or decay) with the UI open
    * http://code.google.com/p/epgp/issues/detail?id=366
  * Use Deformat-3.0 instead of our own
    * http://code.google.com/p/epgp/issues/detail?id=351
  * Added EPGP version to EPGP so that other modules can use it
    * http://code.google.com/p/epgp/issues/detail?id=361
  * Make each module have its own options (option layout changed)
    * http://code.google.com/p/epgp/issues/detail?id=362
  * Fixed full EP not awarded in certain corner cases
    * http://code.google.com/p/epgp/issues/detail?id=342
  * Recurring awards are now resumable if you didn't miss more than one
    * http://code.google.com/p/epgp/issues/detail?id=289
  * Add debugging console
    * http://code.google.com/p/epgp/issues/detail?id=365
  * Fix importing snapshots from EPGP with different BaseGP
    * http://code.google.com/p/epgp/issues/detail?id=369
  * Make the log window resizable
    * http://code.google.com/p/epgp/issues/detail?id=336
  * Add back automatic snapshot (but not the rollback)
    * http://code.google.com/p/epgp/issues/detail?id=350
  * Update error/ignored list after a note changes
    * http://code.google.com/p/epgp/issues/detail?id=363
  * Add GP computation in its own library
    * http://code.google.com/p/epgp/issues/detail?id=358
  * Make announces more granular
    * http://code.google.com/p/epgp/issues/detail?id=296
  * Fix performance regression in LibGuildStorage-1.0 when flushing notes
    * http://code.google.com/p/epgp/issues/detail?id=372

### 5.3.2 - Mar 27th 2009 ###
  * Fix import from epgpweb to restore gp properly
    * http://code.google.com/p/epgp/issues/detail?id=365

### 5.3.1 - Mar 21st 2009 ###
  * Fix empty list of raiders on login
    * http://code.google.com/p/epgp/issues/detail?id=348
  * Export only non-zero EP and non-base\_gp GP members
    * http://code.google.com/p/epgp/issues/detail?id=349

### 5.3 - Mar 20th 2009 ###
  * Fix whisper mod to not announce the instructions for standby when disabled
    * http://code.google.com/p/epgp/issues/detail?id=343
  * Add import/export from http://epgpweb.appspot.com
    * http://code.google.com/p/epgp/issues/detail?id=215

### 5.2.4 - Mar 17th 2009 ###
  * Fix chinese localization loading
    * http://code.google.com/p/epgp/issues/detail?id=337
  * Fix whispers for standby announcement
    * http://code.google.com/p/epgp/issues/detail?id=338

### 5.2.3 - Mar 15th 2009 ###
  * Fix too many rows showing in the standings window
    * http://code.google.com/p/epgp/issues/detail?id=333
  * Fix guild info parsing to assume missing configuration as the default
    * http://code.google.com/p/epgp/issues/detail?id=334
  * Add tiered console level output
    * http://code.google.com/p/epgp/issues/detail?id=335

=== 5.2.2 - Mar 12th 2009
  * Fix automatic loot tracking
    * http://code.google.com/p/epgp/issues/detail?id=326
  * Fix standby EP
    * http://code.google.com/p/epgp/issues/detail?id=330
  * Fix options
    * http://code.google.com/p/epgp/issues/detail?id=331

### 5.2.1 - Mar 10th 2009 ###
  * Escape non-ascii characters in localization files
    * http://code.google.com/p/epgp/issues/detail?id=325

### 5.2 - Mar 9th 2009 ###
  * Rewrite LibGuildStorage to be write back and avoid data corruption on data races
    * http://code.google.com/p/epgp/issues/detail?id=308
  * Fix excessive slowdown on every GUILD\_ROSTER\_UPDATE call
    * http://code.google.com/p/epgp/issues/detail?id=314
  * Fix alt lists from growing indefinitely
    * http://code.google.com/p/epgp/issues/detail?id=315
  * Add guildwide standby EP award modifier
    * http://code.google.com/p/epgp/issues/detail?id=219
  * Compute decay properly
    * http://code.google.com/p/epgp/issues/detail?id=320
  * Use DBM if available to track boss kills
    * http://code.google.com/p/epgp/issues/detail?id=316
  * Add German, Latin American Spanish, Simplified Chinese localizations
  * Enable all localizations

### 5.1.5 - Feb 14th 2009 ###
  * Add Archavon to the boss list
    * http://code.google.com/p/epgp/issues/detail?id=303
  * Fix whispers to toons with names containing non-ascii characters
    * http://code.google.com/p/epgp/issues/detail?id=306
  * Add russian localization. Thank you for contributing! You can contribute more localizations [here](http://wow.curseforge.com/projects/epgp-dkp-reloaded/localization/)
  * Put safety code to avoid data corruption
    * http://code.google.com/p/epgp/issues/detail?id=308

### 5.1.4 - Feb 1st 2009 ###
  * Add automatic boss kill detection (fixed from last release, had some problems)
    * http://code.google.com/p/epgp/issues/detail?id=154
  * Add button to list errors during initialization instead of printing them each time
    * http://code.google.com/p/epgp/issues/detail?id=278
  * Critical bug: when a member is removed from the guild, data corruption can happen to existing members if the said member has his EPGP modified (through awards, decay, credits) before the next !ReloadUI().
    * http://code.google.com/p/epgp/issues/detail?id=302

### 5.1.3 - Jan 14th 2009 ###
  * Auto-fill last EP award amounts for past reasons
    * http://code.google.com/p/epgp/issues/detail?id=256
  * Fix display of PR values > 9999
    * http://code.google.com/p/epgp/issues/detail?id=284
  * Stop popping up credit GP awards to users that are not allowed to credit GP
    * http://code.google.com/p/epgp/issues/detail?id=286
  * Fix spurious errors when guild roster info is delayed after login
    * http://code.google.com/p/epgp/issues/detail?id=287
  * Fix problems with EPGP/controls staying disabled when awarding EP to people outside the guild
    * http://code.google.com/p/epgp/issues/detail?id=291
  * Add automatic boss kill detection
    * http://code.google.com/p/epgp/issues/detail?id=154

### 5.1.2 - Dec 28th 2008 ###
  * Fix snapshot taken on logout instead of only at ReloadUI()
    * http://code.google.com/p/epgp/issues/detail?id=277
  * Make sidepanels hide when the main panel is toggled
    * http://code.google.com/p/epgp/issues/detail?id=281
  * Add [ChatThrottleLib](http://www.wowwiki.com/ChatThrottleLib) support if available
    * http://code.google.com/p/epgp/issues/detail?id=279
  * Add warning icon to officer note warning popup and make it accept on enter
    * http://code.google.com/p/epgp/issues/detail?id=282

### 5.1.1 - Dec 18th 2008 ###
  * Fix bug where after a scroll up or down on the standings the sideframe was giving out EP or GP to the wrong member
    * http://code.google.com/p/epgp/issues/detail?id=276
  * Fix problems with invalid officer notes making the addon do weird things with the EPGP list
    * http://code.google.com/p/epgp/issues/detail?id=267
  * Fix auto-filling of GP to work with single price items again
    * http://code.google.com/p/epgp/issues/detail?id=274

### 5.1 - Dec 17th 2008 ###
  * Fix race conditions when multiple clients update EPGP in the same raid
    * http://code.google.com/p/epgp/issues/detail?id=247
  * Fix game disconnects when awarding EP to a lot of members
    * http://code.google.com/p/epgp/issues/detail?id=261
  * Add automatic backup on each logout and a rollback (restore) function to go back to that state if needed
    * http://code.google.com/p/epgp/issues/detail?id=195
  * Add a redo button to recover after a wrong undo
  * People that cannot award EPGP have all their action buttons (EP or GP changing buttons) disabled
  * Fix problems with static popups getting misaligned by EPGP
    * http://code.google.com/p/epgp/issues/detail?id=191
  * Fix problems with officer notes not being handled correctly when weird settings are configured in Officer Notes
    * http://code.google.com/p/epgp/issues/detail?id=257
  * Add whisper support for standby
    * http://code.google.com/p/epgp/issues/detail?id=217
  * Allow alts of any character set to be entered in the officer notes
    * http://code.google.com/p/epgp/issues/detail?id=235
  * Announce to guild when announce channel is party or raid and you are not in one
    * http://code.google.com/p/epgp/issues/detail?id=245
  * When awarding GP manually fill in `X or Y` for items with multiple GP values
    * http://code.google.com/p/epgp/issues/detail?id=269
  * Add tooltip to the selected item in the GP dropdown menu
    * http://code.google.com/p/epgp/issues/detail?id=270
  * Add a status bar to the bottom of the standings
    * http://code.google.com/p/epgp/issues/detail?id=272

### 5.0.1 - Dec 2nd 2008 ###
  * Stop recurring rewards after leaving raid
    * http://code.google.com/p/epgp/issues/detail?id=243
  * Add [Key to the Focusing Iris](http://www.wowhead.com/?item=44569) to the loot table
    * http://code.google.com/p/epgp/issues/detail?id=242
  * Add officer chat to the announcement options
    * http://code.google.com/p/epgp/issues/detail?id=236
  * Make loot with 2 possible values autocomplete "X or Y" in the popup
    * http://code.google.com/p/epgp/issues/detail?id=238
  * Change /epgp to open the standings window and /epgp config to open the options. You can still assign a keybind through the normal menu
    * http://code.google.com/p/epgp/issues/detail?id=231
  * Fir problems with tooltips showing double rows if used with other mods:
    * http://code.google.com/p/epgp/issues/detail?id=255
  * Fix error when pressing "ENTER" after a GP window popup
    * http://code.google.com/p/epgp/issues/detail?id=253
  * GP window now has both values if the item given out has both a primary and secondary use
    * http://code.google.com/p/epgp/issues/detail?id=232

### 5.0 - Nov 26th 2008 ###
  * Allow selecting members for standby by shift-cliking their names
  * Add on hover tooltips to member to display alts
  * Add personal log that logs the user's actions and enables undo
  * Allow announcements in custom channel
  * Auto GP popup is enhanced by showing the armor's texture in the popup and enabling seeing the stats of the assigned item
  * Auto GP popup only popups out of combat and it multiple loots do not override the previous popup anymore
  * Options are moved into the interface menu. Write /epgp for a shortcut to them
  * Performance enhancements for very large guilds. There should be no UI freezes when assigning EPs in guilds with > 200 members
  * Change GP formula to give more GP to weapon items
  * Change GP formula to double the GP price of an item for each tier of raiding
  * Add Tier 7 armor tokens
  * Remove standby whisper system introduced in 4.0 series
  * Remove right click dropdown for changing an individuals EP/GP. Add a sideframe instead
  * Remove backup/restore
  * Remove export function

### 5.0-beta5 - Nov 24th 2008 ###
  * Fix auto loot tracking to work properly
    * http://code.google.com/p/epgp/issues/detail?id=224

### 5.0-beta4 - Nov 23rd 2008 ###
  * Fix a critical bug that was causing the wrong results when performing a decay or a reset
  * Add announce for reset
    * http://code.google.com/p/epgp/issues/detail?id=216

### 5.0-beta3 - Nov 20th 2008 ###
  * Fix problem with log date not being shown properly
    * http://code.google.com/p/epgp/issues/detail?id=210
  * Fix errors with Deformat library
    * http://code.google.com/p/epgp/issues/detail?id=211
  * Fix problem with log window not updating properly
    * http://code.google.com/p/epgp/issues/detail?id=212
  * Fix formatting error when announcing the start of recurring EP
    * http://code.google.com/p/epgp/issues/detail?id=214

### 5.0-beta2 - Nov 17th 2008 ###
  * Fix font problem that was modifying all fonts in game
    * http://code.google.com/p/epgp/issues/detail?id=206
  * Add GP for greens and blues
    * http://code.google.com/p/epgp/issues/detail?id=208
  * Fixed broken Guild Info parsing
    * http://code.google.com/p/epgp/issues/detail?id=207

### 5.0-beta1 - Nov 16th 2008 ###
  * Fix a bug with standings scrolling not being updated properly

### 5.0-beta0 - Nov 16th 2008 ###
  * Allow selecting members for standby by shift-cliking their names
  * Add on hover tooltips to member to display alts
  * Remove right click dropdown for changing an individuals EP/GP. Add a sideframe instead
  * Add personal log that logs the user's actions and enables undo
  * Allow announcements in custom channel
  * Remove standby whisper system introduced in 4.0 series
  * Auto GP popup is enhanced by showing the armor's texture in the popup and enabling seeing the stats of the assigned item
  * Auto GP popup only popups out of combat and it multiple loots do not override the previous popup anymore
  * Options are moved into the interface menu. Write /epgp for a shortcut to them
  * Performance enhancements for very large guilds. There should be no UI freezes when assigning EPs in guilds with > 200 members
  * Change GP formula to give more GP to weapon items
  * Change GP formula to double the GP price of an item for each tier of raiding

### 4.0-beta-7 - Oct 16th 2008 ###

  * Fix problem with standby whispers
    * http://code.google.com/p/epgp/issues/detail?id=200

### 4.0-beta-6 - Oct 15th 2008 ###

  * Fix for UI bug in 3.0.2
    * http://code.google.com/p/epgp/issues/detail?id=199

### 4.0-beta-5 - Oct 14th 2008 ###

  * Update libraries and toc for 3.0.2 patch

### 4.0-beta-4 - Aug 11th 2008 ###

  * Fix problem loading on russian clients

  * Fix problem with error when enabling recurring EPs

  * Fix warnings in FrameXML.log

  * Fix the nasty problem with officer notes not accepting the 'I' (pipe) character

  * Fix item ids for T6 shoulders

  * Fix problems with alts/outsiders with names with diacriticals

  * Make the EPGP master the ML if it exists otherwise this goes to the RL

  * Add GP values for T6 tokens in the Sunwell

  * Make boss detection much more robust and make it work with 2.4

  * Fix SetEP and SetGP to work properly

  * Fix a problem when invited to a guild while having EPGP enabled

  * Master Looter popup removed.

  * Distribute EP to raid function removed.

  * All EPGP functions are now done by the raid leader not the master looter.

  * Loot is tracked even if assigned through non-master looter ran raids. The popup shows up when someone receives an item and not only when the master looter assigns an item to a member.

  * Automatic tracking of boss kills. When a boss is dead you get a popup to award EP to the raid. The popup remembers the previously entered value for that boss and fills it in as well.

  * All reporting messages now have a reason noted in them. EPs assigned for bosses will appear as: EPGP: Awarded 3000 EPs to raid (Anetheron) if the award was for killing Anetheron. GP awards are also associated with a link to the looted item in the same manner: `EPGP: Credited 333 EPs to Member ([Chestguard of the Fallen Defender]`).

  * Standby members can now whisper 'ep' or their mains name to the raid leader and receive EP as appropriate. This feature is enabled for 1 minute after the initial award is done. After that period the addon stops accepting whispers and reports the awarded members to the designated reporting channel.

  * The view no longer affects where the EP awards are made. It doesn't matter if you are viewing the raid or the guild, Add and Recurring always award EPs to the raid and to standby members as appropriate.

  * The input box next to Add/Recurring awarding buttons is now for the reason of the award and not the amount of EP awarded.

### 3.3.11 - Oct 15th 2008 ###

  * Fix for UI bug in 3.0.2
    * http://code.google.com/p/epgp/issues/detail?id=199

### 3.3.10 - Oct 14th 2008 ###

  * Update libraries and toc for 3.0.2 patch

### 3.3.9 - Aug 11th 2008 ###

  * Fix problem loading on russian clients

### 3.3.8 - Jun 30th 2008 ###

  * Repackaged 3.3.7 since it had problems with the zip

### 3.3.7 - Jun 27th 2008 ###

  * Fix problem with error when enabling recurring EPs

### 3.3.6 - May 15th 2008 ###

  * Fix the nasty problem with officer notes not accepting the 'I' (pipe) character

### 3.3.5 - Apr 19th 2008 ###

  * Add Sunwell Tier 6 tokens

### 3.3.4 - Apr 2nd 2008 ###

  * Update TOC to work with 2.4

  * Remove some experimental features that lurked in the 3.3.3 release by accident

  * Update LICENSE

### 3.3.2 - Dec 21st 2007 ###

  * Fix a transient error when applying decay

  * Stop saving the keybinds, which messes up keybindings for people with alts and different setups

### 3.3.1 - Nov 15th 2007 ###

  * Bump toc for 2.3

  * Add GP values for BoP crafting plans that drop in SSC/TK

  * Add spanish localization (thanks to Urko Alberdi)

### 3.3 - Oct 19th 2007 ###

  * Add the option of BASE\_GP (read the online manual for more information of what this is and what problems it tries to address)

  * Fix truncation on reporting awards when the string is longer than 255 characters

  * Add a new list of online members of the guild to make awarding to everyone online easier

  * Fix /epgp decay command line command

  * Add GP for Horde version of Magtheridon's head (there are actually 2 itemids for Magtheridon's head: one for Horde and one for Alliance)

  * Make reporting function split output intelligently in multiple lines as needed

### 3.2.1 - Sep 12th 2007 ###

  * Added token database for token loot

  * Split libraries using an embeds.xml for GUI performance freaks

### 3.2 - Aug 1st 2007 ###

  * Hitting enter on ML popup to assign default GP no longer results in an error

  * Add version information in the UI title bar

  * Use FauxScrollFrame instead of ScrollFrame to reduce memory usage especially when the mod is used in guilds with a large number of members

### 3.1.1 - Jun 26th 2007 ###

  * When distributing EPs to the raid with some members not being zoned in, choosing distributing EPs to the also did not actually assign them any EPs

  * Make the list automatically switch to the Raid list when you join a raid

  * Do not disable the command line of the addon if you put it on standby

### 3.1 - May 31st 2007 ###

  * Fix reporting message for recurring EP rewards to report the right list EPs are awarded to

  * Add usage tooltip on the recurring bar (click to set reward value when inactive, click to stop award when inactive)

  * Add ML popup quality threshold. Now you can choose which quality and above will cause the GP popup to apprear

  * Do no show dropdown for adding EP/GP to members if the user is not allowed to make changes to the officer notes

  * Fix leakage of settings/variables to all popups

  * Add Set EP and Set GP options to per member dropdown

  * Add warning before editing officer notes by hand

### 3.0 - May 21st 2007 ###

  * Complete revamp of the UI. It is now a paperdoll frame that toggles by default by pressing 'J'. You can rebind this key to anything you like

  * Added toggle for GP/ilvl/ivalue in tooltips

  * Added toggle for automatic ML popup

  * Support sorting on name, EP, GP and PR

  * Support searching on partial member name and full class name

  * Recurring EP period is now configurable

  * Timer bar countdown for next recurring EP reward

  * Zone checks are now implicit. If members in the raid are not in the same zone as the one that awards the EPs, a popup shows up with option to consider or not these members in the award

  * Make HTML output easier to style

  * Added French and German translations (thanks to Wisdom and Alexander Nastev)

### 2.1.4 - Apr 25th 2007 ###

  * Added GP computation for thrown weapons

  * Fixed error when adding bonus to the raid when the raid included members that do not receive EP (pugs)

### 2.1.3 - Apr 15th 2007 ###

  * Fix bug in backup/restore

### 2.1.2 - Apr 15th 2007 ###

  * Fix error in config panel when officer notes where not initialized properly

  * Fix error in Master Loot popup when the item in question had no derived GP

  * Database module cleanup (no visible changes)

  * Made /epgp reset a bit more robust

  * Removed recurring distribution of EPs (addition still works)

### 2.1.1 - Mar 26th 2007 ###

  * Recurring EP add/distribution error fix, to award EPs to members in raid and not necessarily in zone

### 2.1 - Mar 24th 2007 ###

  * Change designation of alts. Now alts are not stored in Guild Information but in officernotes instead. Adding the name of the main in the alts officernote will mark this toon as an alt and link all EPGP to the main's copy

  * Implement timed based EP awards (both add and distribute modes). Period is fixed at 15min intervals

  * Implement support for outsiders in the guild (works exactly like the alts in 2.0)

  * Add config tooltip so that guild members can see the addons configuration in one easy to read place

  * Removed Compost from libraries

  * Changed HTML export to add an id tag to the table (epgp-standings) and a class tag to the td elements that store member names.This should allow very easy CSS styling of the table

  * Added plain text export for easier forum posting

  * Added popup for assigning GP when the ML awards a piece to a raid member

### 2.0.1 - Mar 5th 2007 ###

  * Added relics to the GP table

  * Fix bug with double menu in recent Dewdrop library revisions

### 2.0.1 - Feb 23rd 2007 ###

  * Fix memory leak in EPGP

  * Persist icon hiding (and other options) when EPGP integrates with FuBar

### 2.0 - Feb 21st 2007 ###

  * Added GP values on tooltips computed on an ilvl based formula

  * Implemented the _decay_ and _min ep_ model instead of _raid window_ and _min raids_

  * Added method to distribute EPs to members (K EPs divided across N members in raid)

  * Colorized member names in submenus

  * Menu reorganization to make it make more sense

  * Backup/restore of officer/public notes

  * Added confirmation dialogs to potentially destructive actions

  * Rewrote backend to not poll GuildRoster() continuously and only update it when really necessary

  * Ability to HTML export the standings table

### 1.4 - Dec 22nd 2006 ###

  * Commander could not award GP for gear received unless the guild settings were set to Flat Credentials

### 1.3 - Dec 6th 2006 ###

  * Bumped toc version to match WoW v2.0.1

  * Added undo for last action on EPGP

### 1.2 - Nov 1st 2006 ###

  * Added option to show/hide alts

  * Added option to automatically show only raid members when in raid. This allows for better view of loot priority as it limits the members to just the ones that are eligible to receive loot.

### 1.1 - Oct 30th 2006 ###

  * **Incompatible configuration change**: Options Raid Window and Min Raids are specified differently now in the Guild Information Text. Read Admin Guide for details.

  * New option added to set Flat Credentials mode, where EPGP officers (ranks that can write public/officer notes) have the same credentials as the Guild Master
    * http://code.google.com/p/epgp/issues/detail?id=22

  * Fixed bug where locked tablets stayed locked forever. Now tablets are unlocked when they are hidden
    * http://code.google.com/p/epgp/issues/detail?id=18

  * Fixed list too long on assign GP or assign EP to member. Group by class. This should work for large guilds now
    * http://code.google.com/p/epgp/issues/detail?id=20

  * Make opening/closing epgp history more intuitive. Now Shift-Click on addons toggles the epgp history
    * http://code.google.com/p/epgp/issues/detail?id=21

### 1.0 - Oct 21st 2006 ###

  * Standings and History tables update info in at most a second after it is pushed by raid leader
    * http://code.google.com/p/epgp/issues/detail?id=10

  * Addon spewing errors on unguilded characters
    * http://code.google.com/p/epgp/issues/detail?id=2

  * When a toon is removed it stayed in local persistent cache
    * http://code.google.com/p/epgp/issues/detail?id=11

### 0.91 - Oct 20th 2006 ###

  * Group by class in UI
    * http://code.google.com/p/epgp/issues/detail?id=12

  * Colorize name by class UI
    * http://code.google.com/p/epgp/issues/detail?id=13

  * Add % bonus for last raid
    * http://code.google.com/p/epgp/issues/detail?id=16
<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='AdminGuide_v2.md'>HERE</a>.</b>
</font>

# The addon and guild credentials #

The addon keeps track of EPs and GPs in the public and officer's notes (in game). It also expects a directive of the alts (if you want to share EPs and GPs between them in guild information.

Because it uses in game elements that need special credentials to be edited, it
is recommended that you use the following setup:

  * **Guild Master**: able to edit everything.
  * **Officers (or Raid Leaders)**: able to read/write everything, except guild information.
  * **Rest**: able to read at least public and officer's notes and guild information.

# Usage #

Once you install the addon, you need to wipe your public and officer notes. In order to do this you can type:

```
/epgp reset
```

as Guild Master, effectively setting all the public and officer notes to nothing. This is the only command that is only accessible from the commandline, due to its destructive nature. The rest of the functionality can be accessed either by right clicking the minimap icon, or through the command line (/epgp help shows available options).

If the addon is installed as described above and the ranks are set as recommended then the following functions can be used by the different ranks. Of course members higher in the hierarchy can perform all the functions people lower in the hierarchy can.

  * Guild Master
    * Reset EP/GP
    * Award EPs to individual member
    * Change the raid window
    * Change the min raids
  * Officers
    * Award EPs to raid (only awards EPs to those in the same zone as the Raid Leader)
    * Credit GPs to individual members
    * Start new raids (effectively throwing away the last raid of the history and start keeping track of the new one in the latest raid slot)
  * Members
    * Check EPs/GPs and get the standings sorted by PR. This panel can be accessed by clicking the minimap icon
    * Report EP/GP Standings and History on a channel of their choice (Guild, Party, Raid)

# Sharing EPs and GPs among alts #

You can choose to group all toons of the same member into a single pool of EP/GP. In order to do this the guild information text must be edited. For each alt a line must be added like so:

```
Main:Alt
```

This means that Main and Alt will have a shared pool of EPs and GPs and only Main will appear in standings and history.

A Main can have multiple alts simply by specifying multiple toon names separated by a space:

```
Main:Alt1 Alt2 Alt3
```

Please note that it is not advisable to change this information once you started using EPGP. Additions to it should not matter (adding more alts for existing mains, or even new ones). Changing Main:Alt to Alt:Main just to make alt's name appear instead of the main's will wreck havock in those members' EPs and GPs.

# Other options #

## Raid window ##

You can change the Raid Window (defaults to 10) by adding the following line in guild information:

```
@RW:<number>
```

Where 

&lt;number&gt;

 is an integer from 1 to 15.

## Min raids ##

You can change the Min Raids (defaults to 2) by adding the following line in guild information:

```
@MR:<number>
```

Where 

&lt;number&gt;

 is an integer from 0 to the Raid Window. Flat credentials

You can change the credentials for be flat (defaults to hierarchical) by adding the following line in guild information:

```
@FC
```

This will give the same privileges to people who can edit public/officer notes as the Guild Master (so they will be able to assign individual EPs and reset all EPs).

# Example Usage #

The Raid Leader uses the Start New Raid option of the addon to discard the last raid and start logging EPs/GPs for the current raid. Then invites are sent to all scheduled members, 10 mins before the scheduled time. On the scheduled time (provided the Raid Leader is the pre-announced meet-up place) awards bonus EPs for the raid members being on time. (NOTE: Since the addon awards EPs only to the raid members that are in the same zone as the Raid Leader, it is not necessary to check who is there or not from the people actually in the raid).

Raid starts, and first boss is down. Assuming that the guild policy is to award EPs and then loot, the Raid Leader awards the raid with the predetermined EPs for the boss kill. Then he announces the loot. The drop is a non-class drop so all are eligible for it. The member at the top of the standings list needs the item. The Raid Leader gives the item to the member and credits him with the predetermined amount of GPs for the item. The member's PR will automatically be updated after this action and he may no longer be at the top of the standings list.

The raid ends and the Raid Leader awards some bonus points to those still in the Raid for staying until the end using either a fixed amount (add EP to raid) or a percentage amount (add bonus % to raid). The raid is disbanded and no further action is necessary.
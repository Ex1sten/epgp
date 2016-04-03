<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='AdminGuide_v3.md'>HERE</a>.</b>
</font>

# The addon and guild credentials #

The addon keeps track of EPs and GPs in the officer's notes (in game). It also expects a directive of the out of guild members to keep track of in Guild Information.

Because it uses in game elements that need special credentials to be edited, it is recommended that you use the following setup:

  * **Guild Master**: able to edit everything.
  * **Officers (or Raid Leaders)**: able to read/write everything, except guild information.
  * **Rest**: able to read officer's notes and guild information.

# Usage #

Once you install the addon, you need to wipe your officer notes. In order to do this you can type:

```
/epgp reset
```

as Guild Master, effectively setting all officer notes to nothing. This is the only command that is only accessible from the command line, due to its destructive nature. The rest of the functionality can be accessed either by right clicking the minimap icon, or through the command line (/epgp help shows available options).

If the addon is installed as described above and the ranks are set as recommended then the following functions can be used by the different ranks. Of course members higher in the hierarchy can perform all the functions people lower in the hierarchy can.

  * Guild Master
    * Reset EP/GP
    * Award EPs to individual member
    * Change the decay factor
    * Change the min EP setting
  * Officers
    * Award EPs to raid (only awards EPs to those in the same zone as the Raid Leader)
    * Credit GPs to individual members
    * Start new raids (effectively throwing away the last raid of the history and start keeping track of the new one in the latest raid slot)
  * Members
    * Check EPs/GPs and get the standings sorted by PR. This panel can be accessed by clicking the minimap icon

# Upgrading from older version #

**IMPORTANT: Backup your public/officer notes before you perform the upgrade**

If you are upgrading from an older version of EPGP that was using the Raid Window and Min Raids concepts you first need to upgrade your public and officer notes. You can do this by executing the command:

```
/epgp upgrade <factor>
```



&lt;factor&gt;

 is a number with which all your EP and GP will be multiplied with during the upgrade. It is recommended that you use a value of 10 here, so that decay can be computed more accurately (after the decay is computed the number is rounded down to an integer: so with a 10% decay, a 9 becomes an 8 but a 90 becomes an 81 - the latter is far more accurate). At this point the decay computation will be performed on your existing history and then history will be wiped. In this new model EPGP history is not stored in Public/Officer notes anymore.

## Configuring EPGP for your guild ##

EPGP's configuration is read from directives in Guild Information. All EPGP directives should be enclosed in a pair of `-EPGP-`. The rest of Guild Information is free for use for other things as you see fit. Here is an example Guild Information:

```
Welcome to A guild. blah blah blah...
-EPGP-
@FC
@DECAY_P:5
@MIN_EP:500
-EPGP-
```

# Sharing EPs and GPs among alts #

You can choose to group all toons of the same member into a single pool of EP/GP. In order to do this the _alt_'s officernote should be set to the _main_'s name. **The name should exactly match the name of the main toon, including case**.

Please note that it is not advisable to change this information once you start using EPGP. Additions to it are fine (adding more alts for existing _mains_). Changing the _main_ character in a pool of toons will cause EPGP loss for the toons in question.

# Keeping track of EPs and GPs for people outside the guild #

You can also store EP and GP information for people outside the guild by using a _dummy_ account in your guild to store their information. In order to perform the association between the _outsider_ and the _dummy_ you can add the following to the EPGP section of Guild Information:

```
Outsider:Dummy
```

For all intents and purposes _Dummy_ doesn't exist but is a placeholder for _Outsider_'s EPGP and class. One other caveat is that _Outsider_ will appear as the class of _Dummy_ the same os _Outsider_'s.

# Other options #

## Decay Percent ##

You can change the Decay Percent (defaults to 10) by adding the following line in guild information:

```
@DECAY_P:<number>
```

Where 

&lt;number&gt;

 is an integer from 0 to 100.

## Min EPs ##

You can change the Min EPs (defaults to 500) by adding the following line in guild information:

```
@MIN_EPS:<number>
```

Where 

&lt;number&gt;

 is an integer from 0 to the 100000.

## Flat credentials ##

You can change the credentials for be flat (defaults to hierarchical) by adding the following line in guild information:

```
@FC
```

This will give the same privileges to people who can edit public/officer notes as the Guild Master (so they will be able to assign individual EPs and reset all EPs).

# Example Usage #

The Raid Leader uses the Start New Raid option of the addon to discard the last raid and start logging EPs/GPs for the current raid. Then invites are sent to all scheduled members, 10 mins before the scheduled time. On the scheduled time (provided the Raid Leader is the pre-announced meetup place) awards bonus EPs for the raid members being on time. (NOTE: Since the addon awards EPs only to the raid members that are in the same zone as the Raid Leader, it is not necessary to check who is there or not from the people actually in the raid).

Raid starts, and first boss is down. Assuming that the guild policy is to award EPs and then loot, the Raid Leader awards the raid with the predetermined EPs for the boss kill. Then he announces the loot. The drop is a non-class drop so all are eligible for it. The member at the top of the standings list needs the item. The Raid Leader gives the item to the member and credits him with the predetermined amount of GPs for the item. The member's PR will automatically be updated after this action and he may no longer be at the top of the standings list.

The raid ends and the Raid Leader awards some bonus points to those still in the Raid for staying until the end using either a fixed amount (add EP to raid) or a percentage amount (add bonus % to raid). The raid is disbanded and no further action is necessary.
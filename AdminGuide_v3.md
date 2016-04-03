<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='Home.md'>HERE</a>.</b>
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

as Guild Master, effectively setting all officer notes to nothing. This is the only command that is only accessible from the command line, due to its destructive nature. The rest of the functionality can be accessed through the UI.

If the addon is installed as described above and the ranks are set as recommended then the following functions can be used by the different ranks. Of course members higher in the hierarchy can perform all the functions people lower in the hierarchy can.

  * Guild Master
    * Reset EP/GP
    * Change the decay factor
    * Change the min EP setting
    * Change the base GP setting
  * Officers
    * Award EPs to raid
    * Award EPs to individual member
    * Credit GPs to individual members
    * Decay EP and GP
  * Members
    * Check EPs/GPs and get the standings sorted by PR. This panel can be accessed by clicking the minimap icon

# Upgrading from older version #

**IMPORTANT: Backup your public/officer notes before you perform the upgrade**

If you are upgrading from EPGP v1 and you do not want to loose your EPGP data, stop here. Upgrade to [EPGP v2](http://epgp.googlecode.com/files/epgp-2.1.3.zip) first, perform the [upgrade procedure](AdminGuide_v2.md) and then install EPGP v3.

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

You can change the Min EPs (defaults to 1000) by adding the following line in guild information:

```
@MIN_EP:<number>
```

Where 

&lt;number&gt;

 is an integer from 0 to the 100000.

## Base GP ##

You can change the Base GP (defaults to 0) by adding the following line in guild information:

```
@BASE_GP:<number>
```

## Flat credentials ##

You can change the credentials for be flat (defaults to hierarchical) by adding the following line in guild information:

```
@FC
```

This will give the same privileges to people who can edit public/officer notes as the Guild Master. Without Flat Credentials members that can change officer notes cannot perform a reset of EPGP. With Flat Credentials they can.

# UI usage #

The main UI is by default bound to 'J' unless you bound that key to something else. You can assign another keybinding through the standard game menu. When the EPGP UI pops up it will look like this:

![http://epgp-discuss.googlegroups.com/web/main-window.jpeg](http://epgp-discuss.googlegroups.com/web/main-window.jpeg)

In this display you can see the EPGP standings and perform a multitude of functions like:

  * Sort on name, EP, GP or PR
  * Filter the standings to specific members using the search functionality
  * Filter the standings to a specific class by searching for the _full_ class name
  * Add or Distribute EPs
  * Configure the recurring EP rewards and start their timer
  * Export the current standings in HTML or Text formats
  * Switch between the Guild or the Raid list

Switching to the options tab, you can configure the UI.

![http://epgp-discuss.googlegroups.com/web/options.jpeg](http://epgp-discuss.googlegroups.com/web/options.jpeg)

In this tab you can:
  * Decay all EP and GP
  * Toggle automatic GP popup on ML award
  * Toggle GP values in item tooltips
  * Change the reporting channel
  * Backup and restore officer notes
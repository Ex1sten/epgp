<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='WhatIsEPGP_v2.md'>HERE</a>.</b>
</font>

# Introduction #

EPGP is based on the concept of Effort Points and Gear Points. Effort Points quantify the effort each member put towards the (common) guild goals and Gear Points quantify what each member got back in return. Loot priority is computed as the quotient of the two; priority (PR) is equal to EP/GP.

In a sense EPGP is like zero sum, but without all the need to rebalance the system, or impose taxes to give points for other effort put into the guild. Zero sum awards GP/N points to each player for each item dropped (GP the value of the item and N the number of players in the raid) so that the sum of all points for the members of the guild is zero. EPGP on the other hand is by definition self balanced since priority (and hence chance to receive loot) is directly proportional to the effort you put and inversely proportional to the rewards you got. It is also much more flexible than zero sum since it doesn't require a specific balance point (sum to be equal to zero for example). As such points can be awarded for almost anything without any taxation or over complicating the system (see below). Also another problem with zero sum is the random value of each boss. A boss kill is a boss kill and the effort to kill it is the same no matter if it happened to drop 1 or 2 epics. With zero sum since the amount of effort points the members get is proportional to the loot dropped which is definitely not representing fairly the effort each member puts in the guild.

EP can be awarded through a multiple activities:

  * Being on time for raids
  * Killing bosses
  * Wiping on new boss tries
  * Being present until the end of raid
  * Being extraordinarily helpful to the guild (making pots for a specific fight)
  * Doing some grunt work noone wants to tackle, like updating the guild's website

GP points are accounted though some other set of action:

  * Receiving loot in a raid
  * Receiving items from the guild bank for high level enchants
  * Getting gold from bank for repairs/mats

Clearly each guild can choose to use any combination (or even come out with its own point assignment) of the above points. Assignment of points for each activity/action is not something that EPGP tries to solve. This is solely left to the guild management, as it is out of the scope of the core of the system (and is also the case with many popular loot systems).

Another twist in EPGP, that makes it different than other loot systems is the use of a Raid Window (RW). This window of say N raids, represents the last X raids for which EP and GP are accounted for. This means that EP and GP are summed over the last N raids only. This solves a multitude of problems that exist in loot systems in practice, like DKP (EP in this case) hoarding and new members receiving loot after disproportionately large effort. Another part of the Raid Window concept is the Min Raids (MR) for EPs to become effective. Given some number K, where 0 <= K <= N, a member needs to participate in at least K raids in order for his/hers EP and GP to be effective. Otherwise they default to nothing. Min Raids solves the attendance problem, as it requires members to participate in at least K/N raids in general in order to receive loot. Hardcore guilds might want to put this ratio very high to promote high attendance, casual guilds can tune it somewhat low to give incentive to people that don't raid that often to participate.

# Specifics #

Each member starts with EP = 0 and GP = 1. As such PR = 0. As EP are awarded PR goes up and as GP are awarded PR goes down. Let us look at an example. Assume 3 members A, B and C, EP per raid 10, GP per item 10, and RW = 3. Also assume that member A attends all raids, member B and C only 2 out 3.

Here's how EPGP look like before the start of raiding:

|**Member**| **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:---------|:---------------|:-----------|:-----------|:-----------|
| A        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |
| B        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |
| C        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |

In the first raid the all attend, and A and B receive loot:

| **Member** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 10/10 (1)      | 10/10      | 0/0        | 0/0        |
| B          | 10/10 (1)      | 10/10      | 0/0        | 0/0        |
| C          | 10/1 (10)      | 10/0       | 0/0        | 0/0        |

Notice that the default GP = 1 doesn't account in the GP sum. In the second raid all participate so the next to receive loot is C and lets say that B receives loot as well (member B is tied with member A so they roll):

| **Member** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 20/10 (2)      | 10/0       | 10/10      | 0/0        |
| B          | 20/20 (1)      | 10/10      | 10/10      | 0/0        |
| C          | 20/10 (2)      | 10/10      | 10/0       | 0/0        |

Now in the next raid only A participates and receives a piece of loot:

| **Member** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 30/20 (1.5)    | 10/10      | 10/0       | 10/10      |
| B          | 20/20  (1)     |  0/0       | 10/10      | 10/10      |
| C          | 20/10  (2)     |  0/0       | 10/10      | 10/0       |

Time for the next raid and everyone participates. Next in line to receive loot are C and A. And they do:

| **Member** | **EP/GP  (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:----------------|:-----------|:-----------|:-----------|
| A          | 30/20 (1.5)     | 10/10      | 10/10      | 10/0       |
| B          | 20/10  (2)      | 10/0       |  0/0       | 10/10      |
| C          | 20/20  (1)      | 10/10      |  0/0       | 10/10      |

Up to this point A received 3 pieces of loot, B and received 2 pieces.

# Problems/Solutions #

## EP hoarding ##

This problem is non-existent in EPGP because of the use of the Raid Window. Only temporal EP and GP are accounted. So if you do not "use" the priority gain you had in that raid window it is simply lost slowly over time as raids that happen long ago get dropped from the window.

## New members vs veterans ##

Because of the Raid Window, new members become equal under the system, in a time equal to the Raid Window. This is simply because the system "forgets" all events (EP received or loot awarded) that happened RW raids ago.

## Members that are geared up vs members that are not ##

Members that are geared up already will end up with the highest PR possible and will have first priority over a new (rare) drop. This will satisfy these members. Members that are not geared up already will end up getting loot sometime in the Raid Window and their priority will be low. So they will still gear up but they will not threaten members that wait for a special piece to drop in order to get their satisfaction as well.

## Complexity ##

Unlike Zero Sum with taxation, rebalancing when members join/leave guild, this system is extremely simple to understand and keep track of. This has the effect of having more members understand why and why not they did or didn't receive a piece of loot. This also adds up to member satisfaction and in the guilds welfare.

## Hard to assign item values and boss kill/tries values ##

Because effort points are decoupled from effort points it is easier to assign "good" values for each category. Guild Masters/Officers can focus on balancing different boss kill/tries, materials farming rewards separately from item values. If you notice in the above example nothing would change if each raid was awarding 987 EP and each piece was worth 123 points. Balancing rewards and items is extremely hard; balancing them in isolation is quite simpler.
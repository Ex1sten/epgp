<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='Home.md'>HERE</a>.</b>
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

Another twist in EPGP, that makes it different than other loot systems is the fact that EP and GP decay over time. The decay can be set by the guild master (it can also be disabled if it is set to zero). With a decay of N%, after each raid the guild participates in, each member gets her EP and GP reduced by N%. This eliminates EP (DKP) hoarding.

Because of the fact that EP decays over time, we can use a simple metric to estimate attendance: Min EPs. Given a value for Min EPs we choose to give PR = 0 to those that have less than Min EPs. As an example, assume a guild where about 500 EPs are awarded per member per raid and a Decay of 10%. If Min EPs is set to 1300 then a member needs to be in at least the last 3 raids to be eligible for loot (500+450+405), or the last 4 raids before the last one 450+405+365+329. This is arguably a better measure than attendance, as attendance is a somewhat loose criterion: if a member came to a raid for 1 hour only and the rest were in it for 4, do they all count as the attended the raid? Since EP measures the effort of each member, having a Min EP puts the cut-off at an effort point which will work both for new members and old members. An old member that is idle for a long time will loose EPs gradually so she might get lower than Min EPs which makes her ineligible for loot. A new member starts with EP equal to zero so he needs to attend some raids in order to get his EP above Min EP to be eligible for loot.

Another way to combat people with 0 GP skyrocketing on the PR meters (trials or inactive members that just became active) is with Base GP. With Base GP set to X everyone's effective GP becomes X + Individual GP. Effective GP will never go below X. Using Base GP has a major ramification:

  * GP decays faster than EP. This is because on every decay you decay an extra Base GP x Decay% but you will never reach 0 GP.

Of course you can use both Min EP and Base GP (or just one of the two).

# GP Values #

EPGP also adds a tooltip line to items displaying the GP value of the item. The GP value is computed using the _item level_ and the _equipping slot_ of each item as follows:

**GP** = **item value**<sup>2</sup> x 0.04 x **slot value**

Item value is computed using the following:

| **Item Quality**      | **Item value** |
|:----------------------|:---------------|
| Uncommon _(Green)_    | (**ilvl** - 4) / 2      |
| Rare _(Blue)_         | (**ilvl** - 1.84) / 1.6 |
| Epic _(Purple)_       | (**ilvl** - 1.3) / 1.3  |

Slot mod is given by the following table:

| **Equipping Slot** | **Slot value** |
|:-------------------|:---------------|
| Head, Chest, Legs, 2H Weapon | 1              |
| Shoulder, Hands, Waist, Feet | 0.777          |
| Trinket            | 0.7            |
| Wrist, Neck, Back, Finger, Off-hand, Shield | 0.55           |
| 1H Weapon, Ranged Weapon, Wand | 0.42           |

Just giving some examples, using the above formula gives the following GP values for the following items (mainly priest items).

Chest pieces:
  * [Robes of Ronin](http://www.wowhead.com/?item=30913) 530
  * [Shroud of Absolution](http://www.wowhead.com/?item=31065)/[Vestments of Absolution](http://www.wowhead.com/?item=31066) 495
  * [Garnments of Temperance](http://www.wowhead.com/?item=32340) 461
  * [Shroud of the Avatar](http://www.wowhead.com/?item=30159)/[Vestments of the Avatar](http://www.wowhead.com/?item=30150) 410
  * [Robes of the Incarnate](http://www.wowhead.com/?item=29050)/[Shroud of the Incarnate](http://www.wowhead.com/?item=29056) 333
  * [Masquerade Gown](http://www.wowhead.com/?item=28578) 305
  * [Hallowed Garments](http://www.wowhead.com/?item=28230) 200
  * [Robe of Effervescent Light](http://www.wowhead.com/?item=27506) 200
  * [Robe of Faith](http://www.wowhead.com/?item=22512) 194
  * [Vestments of the Oracle](http://www.wowhead.com/?item=21351) 177
  * [Necro-Knight's Garb](http://www.wowhead.com/?item=23069) 165
  * [Robes of Transcendence](http://www.wowhead.com/?item=16923) 132
  * [Robes of Prophecy](http://www.wowhead.com/?item=16815) 99

Staves:
  * [Apostle of Argus](http://www.wowhead.com/?item=30908) 530
  * [Staff of Immaculate Recovery](http://www.wowhead.com/?item=32344) 461
  * [Ethereum-Life Staff](http://www.wowhead.com/?item=29981) 416
  * [Nightstaff of the Everliving](http://www.wowhead.com/?item=28604) 305
  * [Seer's Cane](http://www.wowhead.com/?item=29133) 200
  * [Epoch-Mender](http://www.wowhead.com/?item=28033) 189
  * [Ameer's Judgement](http://www.wowhead.com/?item=30012) 179
  * [Ironstaff of Regeneration](http://www.wowhead.com/?item=27412) 150
  * [Blessed Qiraju Augur Staff](http://www.wowhead.com/?item=21275) 143
  * [Benedition](http://www.wowhead.com/?item=18608)/[Anathema](http://www.wowhead.com/?item=18609) 128
  * [Staff of Rampant Growth](http://www.wowhead.com/?item=20581) 115
  * [Will of Arlokk](http://www.wowhead.com/?item=19909) 96

As you can see this model of assigning values to items, scales well between rare and epic items alike. In the above list there are blue items that are of better quality than epics and their GP value correctly models this fact.

# Specifics #

Each member starts with EP = 0 and GP = 0. As such PR = 0. As EP are awarded PR goes up and as GP are awarded PR goes down. Let us look at an example. Assume 3 members A, B and C, EP per raid 10, GP per item 10, and DECAY\_P = 10. Also assume that member A attends all raids, member B and C only 2 out 3.

Here's how EPGP look like before the start of raiding:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 0+0                               | 0+0                              | 0      |
| B        | 0+0                               | 0+0                              | 0      |
| C        | 0+0                               | 0+0                              | 0      |

In the first raid the all attend, and A and B receive loot:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 10+0                              | 10+0                             | 1      |
| B        | 10+0                              | 10+0                             | 1      |
| C        | 10+0                              | 0+0                              | 10     |

Notice that the when GP is 0 when computing PR we take it as 1. In the start of the second raid EP and GP will decay by DECAY\_P%. The standings will look as follows:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 0+9                               | 0+9                              | 1      |
| B        | 0+9                               | 0+9                              | 1      |
| C        | 0+9                               | 0+0                              | 9      |

In the second raid all participate so the next to receive loot is C and lets say that B receives loot as well (member B is tied with member A so they roll):

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 10+9                              | 0+9                              | 2.1    |
| B        | 10+9                              | 10+9                             | 1      |
| C        | 10+9                              | 10+0                             | 1.9    |

In the beginning of the third raid we decay all EP and GP again. The standings table will look as follows:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 0+17                              | 0+8                              | 2.1    |
| B        | 0+17                              | 0+17                             | 1      |
| C        | 0+17                              | 0+9                              | 1.9    |

Notice that even though A and C attended the same raids and received the same loot A's PR is higher than C's. This is because A received an item earlier than B so that item's value decayed for more time than B's item.

Now in the next raid only A participates and receives a piece of loot:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 10+17                             | 10+8                             | 1.5    |
| B        | 0+17                              | 0+17                             | 1      |
| C        | 0+17                              | 0+9                              | 1.9    |

Time for the next raid. The starting table will look as follows:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 0+24                              | 0+16                             | 1.5    |
| B        | 0+15                              | 0+15                             | 1      |
| C        | 0+15                              | 0+8                              | 1.9    |

Everyone participates. Next in line to receive loot are C and A. And they do in which case the final table will look like this:

|**Member**| **EP (Last Raid+Previous Raids)** | **GP(Last Raid+Previous Raids)** | **PR** |
|:---------|:----------------------------------|:---------------------------------|:-------|
| A        | 10+24                             | 10+16                            | 1.3    |
| B        | 10+15                             | 0+15                             | 1.7    |
| C        | 10+15                             | 10+8                             | 1.4    |

Up to this point A received 3 pieces of loot, B and C received 2 pieces.

# Problems/Solutions #

## EP hoarding ##

This problem is non-existent in EPGP because of the use of the EP and GP decay. Only temporal EP and GP are accounted. So the latest you "use" your PR lead the least amount of benefit you get out of it. And the earliest you take an item, the faster its value will decay.

## New members vs Veterans ##

Because of the decay, new members become equal under the system much faster. EPs decay over time so with a 10% decay in about 15 raids a veteran has about the same EP as a new member (if they both attended the same raids). The only barrier to entry for new members is reaching Min EPs in order to be eligible for loot.

## Members that are geared up vs members that are not ##

Members that are geared up already will end up with the highest PR possible and will have first priority over a new (and possibly rare) drop. This will satisfy these members. Members that are not geared up already will end up getting loot in most raids which will keep their priority low. So they will still gear up but they will not threaten members that wait for a special piece to drop in order to get their satisfaction as well.

## Complexity ##

Unlike Zero Sum with taxation, which is very similar, there is no need to rebalance when members join/leave guild, and no changes in tax/decay because of more tries on new content. The reduced complexity of the system allows more people to understand it, which keeps the queries to the guild master low and member satisfaction up.

## Hard to assign item values and boss kill/tries values ##

Because effort points are decoupled from effort points it is easier to assign "good" values for each category. Guild Masters/Officers can focus on balancing different boss kill/tries, materials farming rewards separately from item values. If you notice in the above example nothing would change if each raid was awarding 987 EP and each piece was worth 123 points. Balancing rewards and items is extremely hard; balancing them in isolation is quite simpler.

## Randomness on boss value in zero sum ##

Zero Sum's major flaw is that for the same encounter, you might end up getting more or less points, depending on the loot (which is random). This introduces a major cause of unfairness to the system, since the same boss, which requires the same effort, is worth more in some runs and less in others. In EPGP each boss awards the same EP every time, adding to the fairness of the system.
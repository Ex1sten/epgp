# Introduction #

EPGP has had a few changes for Firelands that you should know about.

  * **Show Offline Members** checkbox now works!
  * **Price Normalization!**  Now every tier's GP cost should stay constant.
  * **T12 loot**, including Crystallized Firestones
  * **Reduced Trinket Price**
  * **Guidance for Dual Wield Weapon Cost**
  * Outsiders Patch is now integrated.  Be aware this is experimental.

# Show Offline Members #

The checkbox is back and works!  Enjoy.

# Price Normalization #

EPGP now employs price normalization between tiers.  This means a non-heroic chest piece will always cost 1,000 GP.  When a new tier is released, old items drop in price.  So, for instance, the day before Firelands was released, a Tier 11 chest piece cost 1,000GP.  The next day, the new Tier 12 chest pieces would cost 1,000 GP, and the old Tier 11 chest piece now costs 603 GP.  Intuitively, this makes sense -- a new tier makes old gear less valuable!

The motivation for this change was to prevent GP inflation across multiple tiers and to make EPGP easier to understand.  Prices will be more familiar.  Under the hood, this doesn't actually change the order people get loot (much), as it is evenly applied to all players.

One thing to note is that when a new tier is released, however, you should consider either resetting GP (**not** EP) or rescaling GP.  The former sets everyones' GP to zero and keeps EP as it currently is -- a clean slate for loot, but remembering attendance!  The latter reduces the GP each player has by the tier's scaling value (i.e., as if they had paid the lower price all along).

**Resetting GP** is, in my biased opinion, the best choice.  By resetting each tier, you encourage people to take loot from the previous tier up until the last possible minute.

**Rescaling GP** is a good choice, too, if you don't want to reset GP.  By rescaling, you basically don't punish someone who recently took loot by charging them a price that is relatively high compared to loot that is now dropping.

Both Resetting GP and Rescaling GP are options in the EPGP Options window (type "/epgp config" or go from the game menu to Interface -> AddOns tab -> EPGP).

# T12 Loot #

As in previous tiers, Firelands uses an upgrade system.  These items should have proper EPGP cost.  The notable exception is **Crystallized Firestones** which are used to upgrade a variety of slots, ranging from relics (which are very cheap in EPGP) to ranged weapons for Hunters (which are very expensive).  While EPGP does offer a default price for Crystallized Firestones (2121 GP, the same as a trinket cost), **it is recommended that you do not use this price** and instead charge based on the item the player is upgrading.  However, things will work if you choose to just charge that price, though people will likely complain how expensive their relic upgrades are!

# Reduced Trinket Pricing #

Trinkets were too cheap in WotLK and too expensive in the initial Cataclysm Tier 11 raid.  They now should be somewhat cheaper (25% cheaper than they were in Tier 11).  Feedback is welcome on the new pricing.

# Dual Wield Weapon Pricing #

For Fury Warriors (both Single Minded Fury and Titan's Grip), Death Knights, Hunters, and Combat Rogues, it is recommended to not use offhand prices except under very specific circumstances.  Since those classes dual wield weapons that can be used as a main-hand (or the only) weapon for another player, and since off-hand items tend to have less of a DPS impact than main-hand weapons, and since the only time such a player upgrades an off-hand is when their main-hand already has been upgraded, charging a reduced price is arguably unfair to others in the raid.

To address this issue, it is recommended to not give an off-hand weapon if anyone can use it as their main-hand or only weapon.  When this is the case, charging the lower price is acceptable.  Alternatively, the player can be given the option to pay the larger price -- even though it is less of an upgrade for them, it at least costs the same as the weapon would for someone for whom it would have a larger impact.

Put another way: only charge off-hand prices if no one will use the weapon as a main-hand or as their only weapon.  Otherwise always charge the larger price.

# Outsider Support (Experimental) #

The outsider patch has been merged with EPGP; add '@OUTSIDERS:1' to your guild note to activate it.  More documentation coming soon.
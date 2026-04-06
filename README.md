How to use:

Each "module" of Jenstuff is standalone and not immediately compatible with the others. If you need to use multiple, contact Jenna and she will combine them for you if you're not confident about it.

To use a module, extract the CONTENTS of the folder into your mission file, next to the mission.sqm. From there, each module will work out of the box, but there are often settings within the initplayerlocal.sqf file. The options are documented below.

Artillery:

jen_artilleryAmmo = "R_230mm_HE";
Class name for the ammo used in artillery.

jen_artilleryCount = 5;
Number of rounds per barrage.

jen_artilleryCooldown = 15;
Cooldown in seconds between barrages.

jen_artilleryIsCoolingDown = false;
Do not touch this, please.

jen_artilleryBarrages = 10;
Number of barrages available in the mission.

jen_artillerySpread = 50;
Radius of spread in meters.

jen_artilleryDelay = 2;
Delay between calling in artillery and artillery ammo being spawned.


Reinsert:

jen_reinsertCooldown = false;
Do not touch this, please.

jen_reinsertDelay = 300;
Cooldown in seconds for squad leaders MOVING the respawn beacon. 

jen_beaconRespawnDelay = 120;
After beacon is destroyed, this is the cooldown in seconds added to the reinsert delay. For instance, if a squad leader moved the beacon and it is instantly destroyed, it will by default take 420 seconds to be available again.

jen_reinsertClass = "Land_3AS_Small_Sensor";
Class name of the reinsert beacon object.

jen_reinsert_hasReinserted = false;
Do not touch this, please.




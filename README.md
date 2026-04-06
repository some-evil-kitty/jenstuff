How to use:

Each "module" of Jenstuff is standalone and not immediately compatible with the others. If you need to use multiple, contact Jenna and she will combine them for you if you're not confident about it.

To use a module, extract the CONTENTS of the folder into your mission file, next to the mission.sqm. From there, each module will work out of the box, but there are often settings within the initplayerlocal.sqf file. The options (and descriptions of what each module does) are documented below.

Artillery:

Adds off-map artillery that can be called in by any squad leader with a laser designator. Squad leaders simply point their laser and hold spacebar. Only one artillery barrage can be in progress at any time and there is a cooldown between them. If the mission maker wants to start with artillery unavailable and make it available partway through a mission, set the barrage number to -1 and use a trigger to then set it to the desired number of available barrages. For instance, an objective can be to capture a satellite uplink and call in orbital barrages.

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

Very simple! Any squad leader can place down a beacon that newly-respawned squadmates can teleport to one time per life. There is a configurable cooldown and the beacon can be any object.

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




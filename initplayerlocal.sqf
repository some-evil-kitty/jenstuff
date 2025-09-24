jen_opflow_reinsertCooldown = false;
jen_opflow_reinsertDelay = 300;
jen_opflow_beaconRespawnDelay = 120;
jen_opflow_reinsertClass = "your_class_here";

["jen_opflow_reinsertBeaconKilled",{
    jen_opflow_reinsertTimer = jen_opflow_reinsertTimer + jen_opflow_beaconRespawnDelay;
}] call CBA_fnc_addEventHandler;
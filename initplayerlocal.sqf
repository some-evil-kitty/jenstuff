jen_opflow_reinsertCooldown = false;
jen_opflow_reinsertDelay = 300;
jen_opflow_beaconRespawnDelay = 120;
jen_opflow_reinsertClass = "your_class_here";
jen_opflow_reinsert_hasReinserted = false;

["jen_opflow_reinsertBeaconKilled",{
    jen_opflow_reinsertTimer = jen_opflow_reinsertTimer + jen_opflow_beaconRespawnDelay;
}] call CBA_fnc_addEventHandler;

private _moveBeacon = ["jen_opflow_moveBeacon","Move Reinsert Beacon","",{
    [3, [], {
        [group player] call jen_opflow_fnc_moveReinsert;
    }, {}, "Moving Reinsert Beacon..."] call ace_common_fnc_progressBar
},{(leader group player) == player}] call ace_interact_menu_fnc_createAction;

[player, 0, ["ACE_SelfActions"], _moveBeacon] call ace_interact_menu_fnc_addActionToObject;

private _reinsert = ["jen_opflow_doReinsert","Reinsert to Beacon","",{
    [3, [], {
        [player] call jen_opflow_fnc_doReinsert;
    }, {}, "Deploying..."] call ace_common_fnc_progressBar
},{!jen_opflow_reinsert_hasReinserted}] call ace_interact_menu_fnc_createAction;

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
    jen_opflow_reinsert_hasReinserted = false;
}];
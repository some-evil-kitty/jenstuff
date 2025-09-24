if jen_opflow_reinsertCooldown exitWith {};

params ["_group"];

private _reinsertBeacon = _group getVariable ["jen_opflow_reinsertObject",objNull];

// Handle first placement and deleted/invalid beacons. 
if isNull _reinsertBeacon then {
	_reinsertBeacon = [_group] call jen_opflow_fnc_createReinsertBeacon;
};

if !(alive _reinsertBeacon) then {
	deleteVehicle _reinsertBeacon;
	_reinsertBeacon = jen_opflow_reinsertClass createVehicle [0,0,0];
};

_reinsertBeacon setPosASL (getPosASL leader _group);
_group setVariable ["jen_opflow_reinsertObject",_reinsertBeacon,true];

jen_opflow_reinsertCooldown = true;

jen_opflow_reinsertTimer = cba_missionTime + jen_opflow_reinsertDelay;

[{cba_missionTime > jen_opflow_reinsertTimer}, {
    jen_opflow_reinsertCooldown = false;
	hint "Reinsert Beacon Ready";
}, _holder, (jen_opflow_reinsertDelay + jen_opflow_beaconRespawnDelay), {
	jen_opflow_reinsertCooldown = false;
	hint "Reinsert Beacon Ready";
}] call CBA_fnc_waitUntilAndExecute;

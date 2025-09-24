if jen_reinsertCooldown exitWith {};

params ["_group"];

private _reinsertBeacon = _group getVariable ["jen_reinsertObject",objNull];

// Handle first placement and deleted/invalid beacons. 
if isNull _reinsertBeacon then {
	_reinsertBeacon = [_group] call jen_fnc_createReinsertBeacon;
};

if !(alive _reinsertBeacon) then {
	deleteVehicle _reinsertBeacon;
	_reinsertBeacon = jen_reinsertClass createVehicle [0,0,0];
};

_reinsertBeacon setPosASL (getPosASL leader _group);
_group setVariable ["jen_reinsertObject",_reinsertBeacon,true];

jen_reinsertCooldown = true;

jen_reinsertTimer = cba_missionTime + jen_reinsertDelay;

[{cba_missionTime > jen_reinsertTimer}, {
    jen_reinsertCooldown = false;
	hint "Reinsert Beacon Ready";
}, _holder, (jen_reinsertDelay + jen_beaconRespawnDelay), {
	jen_reinsertCooldown = false;
	hint "Reinsert Beacon Ready";
}] call CBA_fnc_waitUntilAndExecute;

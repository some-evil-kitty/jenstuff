params ["_group"];

_reinsertBeacon = (jen_reinsertClass createVehicle [0,0,0]);
// If beacon is still null, the vehicle class probably doesn't exist in CfgVehicles. Throw an rpt error and exit.
if isNull _reinsertBeacon exitWith {
    diag_log "[JEN] Reinsert: Unable to create reinsert object. jen_reinsertClass is likely invalid.";
};
// Use a variable rather than feeding params so we can modify it later in weird cases.
_reinsertBeacon setVariable ["jen_reinsertBeaconOwner",_group,true];
_reinsertBeacon addEventHandler ["Killed",
{
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _owner = _unit getVariable ["jen_reinsertBeaconOwner",grpNull];
    if isNull _owner then {
        diag_log "[JEN] Reinsert: Beacon killed, but owner is null. Group may have been deleted erroneously.";
    };
    ["jen_reinsertBeaconKilled",[],(units _owner)] call CBA_fnc_targetEvent;
}];

_reinsertBeacon
private _beacon = (group player) getVariable ["jen_reinsertObject",objNull];
if (isNull _beacon) exitWith {
    hint "No reinsert beeacon has been deployed. Squad leader must deploy beacon before reinsert can be performed at it."
};
[_beacon] call jen_fnc_teleportToObject;
jen_reinsert_hasReinserted = true;
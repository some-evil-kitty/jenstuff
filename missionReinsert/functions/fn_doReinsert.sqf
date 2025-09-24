private _beacon = (group player) getVariable ["jen_opflow_reinsertObject",objNull];
[_beacon] call jen_opflow_fnc_teleportToObject;
jen_opflow_reinsert_hasReinserted = true;
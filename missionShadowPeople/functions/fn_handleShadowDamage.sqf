params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
if !_directHit exitWith {0};
if (_unit getVariable ["jen_shadowPeople_damageDebounce", false]) exitWith {0};
private _health = _unit getVariable ["jen_shadowPeople_health", 3];
if (_context == 0) then {
    _health = _health - 1;
    if (_health == 0) then {
        deleteVehicle _unit;
    } else {
        _unit setVariable ["jen_shadowPeople_health", _health];
        private _lastPos = _unit getVariable ["jen_shadowPeople_lastPosition", getPosASL _unit];
        _unit setPosASL _lastPos;
    };
    _unit setVariable ["jen_shadowPeople_damageDebounce", true];
    [{
        params ["_unit"];
        _unit setVariable ["jen_shadowPeople_damageDebounce", false];
    }, [_unit], 0.1] call CBA_fnc_waitAndExecute;
    0
} else {
    0
};


0
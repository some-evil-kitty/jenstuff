params ["_unit"];

private _slowPFH = [{
    params ["_args", "_handle"];
    _args params ["_unit"];
    if !(alive _unit) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };
    private _currentTarget = _unit getVariable ["jen_shadowPeople_currentTarget", objNull];
    if (!(alive _currentTarget) || (lifeState _unit isEqualTo "INCAPACITATED")) then {
        private _nearTargets = allPlayers select {_unit distance _x < jen_shadowPeople_searchRadius};
        _nearTargets = _nearTargets select {((side _unit getFriend  side _x) < 0.6) && !(lifeState _x isEqualTo "INCAPACITATED")};
        _currentTarget = selectRandom _nearTargets;
        _unit setVariable ["jen_shadowPeople_currentTarget", _currentTarget];
        private _otherFriends = _currentTarget getVariable ["jen_shadowPeople_targetingYou", []];
        _otherFriends = _otherFriends pushBackUnique _unit;
        _unit setVariable ["jen_shadowPeople_targetingYou", _otherFriends, true];
        ["jen_shadowPeople_beingTargeted", [_currentTarget, _unit], _currentTarget] call cba_fnc_targetEvent;
    };
    _unit setVariable ["jen_shadowPeople_lastPosition", getPosASL _unit];
}, 5, [_unit]] call cba_fnc_addPerFrameHandler;

private _fastPFH = [{
    params ["_args", "_handle"];
    _args params ["_unit"];
    if !(alive _unit) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };
    private _currentTarget = _unit getVariable ["jen_shadowPeople_currentTarget", objNull];
    if (!(alive _currentTarget)) exitWith {};
    _unit doMove (getPosASL _currentTarget);
    if (_unit distance _currentTarget < 1.25) exitWith {
        deleteVehicle _unit;
        ["jen_shadowPeople_hurtTarget", _currentTarget, _currentTarget] call cba_fnc_targetEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.05, [_unit]] call cba_fnc_addPerFrameHandler;

_unit setVariable ["jen_shadowPeople_AI_handles", [_slowPFH, _fastPFH]];
params ["_unit", "_shadowPerson"];

private _otherFriends = _unit getVariable ["jen_shadowPeople_targetingYou", []];
// clean up while we're here
_otherFriends = _otherFriends select {!isNull _x};
_otherFriends pushBackUnique _shadowPerson;
["jen_hideObjectLocal", [_shadowPerson, (currentVisionMode _unit != 2)]] call cba_fnc_localEvent;

[{
    params ["_args", "_handle"];
    _args params ["_source"];
    if !(alive _source) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };
    _source say3D ["jen_whispers", 200, 1, 2];
}, 38, _shadowPerson] call cba_fnc_addPerFrameHandler;
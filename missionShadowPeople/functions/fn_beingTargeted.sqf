params ["_unit", "_shadowPerson"];

[{
    params ["_args", "_handle"];
    _args params ["_source"];
    if !(alive _source) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };
    _source say3D ["jen_whispers", 200, 1, 2];
}, 38, _shadowPerson] call cba_fnc_addPerFrameHandler;
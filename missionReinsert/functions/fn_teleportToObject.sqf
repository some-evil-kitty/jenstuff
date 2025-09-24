params ["_object"];

titleText ["","BLACK",0.5];
titleFadeOut 3;

[{
    params ["_object"];
    player setPosASL (getPosASL _object);
}, _object, 1.5] call CBA_fnc_waitAndExecute;
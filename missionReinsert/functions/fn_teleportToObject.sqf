params ["_object"];

titleText ["","BLACK IN",1];

[{
    params ["_object"];
    titleFadeOut 1;
    player setPosASL (getPosASL _object);
}, _object, 1.5] call CBA_fnc_waitAndExecute;
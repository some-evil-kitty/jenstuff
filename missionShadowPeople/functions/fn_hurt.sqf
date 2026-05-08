params ["_unit"];

// Edge case, should never happen
if (_unit != player) exitWith {};


// knock you out of thermals/nvg, turns off flashlight, etc
_unit action ["NvGogglesOff", _unit];
_unit action ["GunLightOff", _unit];
["KND_ToggleLamp", [_unit, false]] call CBA_fnc_globalEvent;

if (ace_player getvariable ["knd_lowlight_on",false]) then {
    setAperture -1;
    ace_player setVariable ["knd_lowlight_on",false];
    ["knd_lowlight_switched", [false, -1]] call CBA_fnc_localEvent;
};

// do pp effects
call jen_fnc_hurtEffect;

// do pain and potential KO
[_unit, jen_shadowpeople_painPerHit] call ace_medical_fnc_adjustPainLevel;
if (_unit getVariable ["ace_medical_pain",0] > 0.9) then {
    [_unit, 0.5, "Head", "cut"] call ace_medical_fnc_addDamageToUnit
};

// do force walk
[_unit, "forceWalk", "jen_shadowPeople_forceWalk", true] call ace_common_fnc_statusEffect_set;
[{
    params ["_unit"];
    [_unit, "forceWalk", "jen_shadowPeople_forceWalk", false] call ace_common_fnc_statusEffect_set;
}, [_unit], 0.2] call CBA_fnc_waitAndExecute;





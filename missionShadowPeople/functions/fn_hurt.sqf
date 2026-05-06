params ["_unit"];

// Edge case, should never happen
if (_unit != player) exitWith {};

_unit action ["NvGogglesOff", _unit];

[_unit, jen_shadowpeople_painPerHit] call ace_medical_fnc_adjustPainLevel;
call jen_fnc_hurtEffect;
if (_unit getVariable ["ace_medical_pain",0] > 0.9) then {
    [_unit, 0.5, "Head", "cut"] call ace_medical_fnc_addDamageToUnit
};

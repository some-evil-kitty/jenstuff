params ["_unit"];

// Edge case, should never happen
if (_unit != player) exitWith {};


// knock you out of thermals/nvg
_unit action ["NvGogglesOff", _unit];

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





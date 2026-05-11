params ["_obelisk", "_unit"];

if (_unit == player) then {
    [false] call jen_fnc_bleedingFeedback
};
_unit setVariable ["jen_bloodObelisk_isBleeding", false, true];


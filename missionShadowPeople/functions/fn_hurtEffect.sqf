private _priority = 0;
while {
    _handle1 = ppEffectCreate ["DynamicBlue", _priority];
    _handle1 < 0
} do {
    _priority = _priority + 1;
};
_handle1 ppEffectEnable true;
_handle1 ppEffectAdjust [5];
_handle1 ppEffectCommit 0.3;

_priority = 2500;
while {
    _handle2 = ppEffectCreate ["ColorInversion", 2500];
    _handle2 < 0
} do {
    _priority = _priority + 1;
};
_handle2 ppEffectEnable true;
_handle2 ppEffectAdjust [1,1,1];
_handle2 ppEffectCommit 0.3;

[{
    params ["_handle1", "_handle2"];
    _handle1 ppEffectAdjust [0];
    _handle1 ppEffectCommit 0.3;
    _handle2 ppEffectAdjust [0,0,0];
    _handle2 ppEffectCommit 0.3;
    [{
        {
            ppEffectDestroy _x
        } forEach _this
    }, [_handle1, _handle2], 0.3] call CBA_fnc_waitAndExecute;
}, [_handle1, _handle2], 0.3] call CBA_fnc_waitAndExecute;

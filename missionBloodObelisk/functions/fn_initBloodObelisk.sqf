params ["_obelisk"];

[{
    params ["_args", "_handle"];
    _args params ["_obelisk"];
    private _bloodEaten = _obelisk getVariable ["jen_bloodObelisk_bloodEaten", 0];
    if (_bloodEaten >= jen_bloodObelisk_satiationThreshold) exitWith {
        ["jen_bloodObelisk_obeliskSatiated", _obelisk] call cba_fnc_serverEvent;
        _obelisk setVariable ["jen_bloodObelisk_isFull", true, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
    private _nearTargets = _obelisk nearEntities ["CAManBase",jen_bloodObelisk_maxRange];
    _nearTargets = _nearTargets select {(_x getVariable ["ace_medical_bloodVolume",6] > 0.1) && !(_x getVariable ["jen_bloodObelisk_isBleeding",false])};
    {
        ["jen_bloodObelisk_startBleeding", [_obelisk, _x], _x] call cba_fnc_targetEvent;
        _x setVariable ["jen_bloodObelisk_isBleeding", true, true];
    } forEach _nearTargets;
}, 0.2, _obelisk] call cba_fnc_addPerFrameHandler;
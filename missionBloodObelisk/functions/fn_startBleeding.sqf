params ["_obelisk", "_unit"];

_unit setVariable ["jen_bloodObelisk_storedBlood", -jen_bloodObelisk_drainRate];

if (_unit == player) then {
    [true] call jen_fnc_bleedingFeedback
};

["jen_bloodObelisk_startBleedingParticles", [_unit]] call cba_fnc_globalEvent;

_unit setVariable ["jen_bloodObelisk_bleedingHandle", [{
	params ["_args", "_handle"];
	_args params ["_obelisk", "_unit"];
	private _storedBlood = _unit getVariable ["jen_bloodObelisk_storedBlood", -jen_bloodObelisk_drainRate];
	if ((_unit distance _obelisk > jen_bloodObelisk_maxRange) || (_obelisk getVariable ["jen_bloodObelisk_isFull", false])) exitWith {
		_handle call CBA_fnc_removePerFrameHandler;
		["jen_bloodObelisk_endBleeding", [_obelisk, _unit]] call cba_fnc_localEvent;
		_unit setVariable ["jen_bloodObelisk_isBleeding", false, true];
		if (_storedBlood > 0) then {
			["jen_bloodObelisk_sendBlood", [_obelisk, _storedBlood], _obelisk] call cba_fnc_targetEvent;
		};
	};
	private _bloodLost = jen_bloodObelisk_drainRate * diag_deltaTime;
	private _currentBlood = _unit getVariable ["ace_medical_bloodVolume", 6];
	private _newBlood = _currentBlood - _bloodLost;
	_unit setVariable ["ace_medical_bloodVolume", _newBlood];
	_storedBlood = _storedBlood + _bloodLost;
	if (_storedBlood >= jen_bloodObelisk_bloodPacketSize) exitWith {
		_unit setVariable ["jen_bloodObelisk_storedBlood",0];
		["jen_bloodObelisk_sendBlood", [_obelisk, _storedBlood], _obelisk] call cba_fnc_targetEvent;
	};
	_unit setVariable ["jen_bloodObelisk_storedBlood", _storedBlood];
}, 0, [_obelisk, _unit]] call cba_fnc_addPerFrameHandler];
params ["_activate"];

if (_activate == jen_bloodObelisk_feedbackActive) exitWith {

};

if _activate then {
	jen_bloodObelisk_feedbackActive = true;
	// pp effects
	jen_bloodObelisk_redHandle = 0;
	private _priority = 1500;
	while {
		jen_bloodObelisk_redHandle = ppEffectCreate ["ColorCorrections", _priority];
		jen_bloodObelisk_redHandle < 0
	} do {
		_priority = _priority + 1;
	};
	jen_bloodObelisk_redHandle ppEffectEnable true;
	jen_bloodObelisk_redHandle ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]];
	jen_bloodObelisk_redHandle ppEffectCommit 0.2;
	private _effectParams = [180,100,1];
	private _priority = 1600;
	jen_bloodObelisk_fishEyeHandle = 0;
	while {
		jen_bloodObelisk_fishEyeHandle = ppEffectCreate ["Fisheye", _priority];
		jen_bloodObelisk_fishEyeHandle < 0
	} do {
		_priority = _priority + 1;
	};
	jen_bloodObelisk_fishEyeHandle ppEffectEnable true;
	jen_bloodObelisk_fishEyeHandle ppEffectAdjust _effectParams;
	jen_bloodObelisk_fishEyeHandle ppEffectCommit 0;
	jen_bloodObelisk_fishEyeHandle ppEffectAdjust [180,1,1];
	jen_bloodObelisk_fishEyeHandle ppEffectCommit 0.2;
	jen_bloodObelisk_blurHandle = 0;
	while {
		jen_bloodObelisk_blurHandle = ppEffectCreate ["DynamicBlur", _priority];
		jen_bloodObelisk_blurHandle < 0
	} do {
		_priority = _priority + 1;
	};
	jen_bloodObelisk_blurHandle ppEffectEnable true;
	jen_bloodObelisk_blurHandle ppEffectAdjust [0.3];
	jen_bloodObelisk_blurHandle ppEffectCommit 0.2;
	// sounding
	jen_bloodObelisk_soundHandle = [{
		jen_bloodObelisk_feedBackSoundSource = playSound "jen_bleeding";
	}, 6.8, []] call cba_fnc_addPerFrameHandler;
} else {
	jen_bloodObelisk_feedbackActive = false;
	jen_bloodObelisk_redHandle ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1],	[0.299, 0.587, 0.114, 0]];
	jen_bloodObelisk_fishEyeHandle ppEffectAdjust [0,0,0];
	jen_bloodObelisk_blurHandle ppEffectAdjust [0];
	{
		_x ppEffectCommit 0.2;
		[{
			params ["_handle"];
			ppEffectDestroy _handle;
		}, _x, 0.2] call cba_fnc_waitAndExecute;
	} forEach [jen_bloodObelisk_redHandle, jen_bloodObelisk_fishEyeHandle, jen_bloodObelisk_blurHandle];
	deleteVehicle jen_bloodObelisk_feedBackSoundSource;
	jen_bloodObelisk_soundHandle call CBA_fnc_removePerFrameHandler;
};
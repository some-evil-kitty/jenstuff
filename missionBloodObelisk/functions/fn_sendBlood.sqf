params ["_obelisk", "_blood"];

private _currentBlood = _obelisk getVariable ["jen_bloodObelisk_bloodEaten", 0];
_obelisk setVariable ["jen_bloodObelisk_bloodEaten", _currentBlood + _blood];

["jen_bloodObelisk_dropParticle", [_obelisk]] call cba_fnc_globalEvent;

playSound3D [getMissionPath "snd\eatBlood.wss", _obelisk];
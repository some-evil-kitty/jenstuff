params ["_obelisk", "_blood"];

private _currentBlood = _obelisk getVariable ["jen_bloodObelisk_bloodEaten", 0];
_obelisk setVariable ["jen_bloodObelisk_bloodEaten", _currentBlood + _blood];
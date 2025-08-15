params ["_target"];

["jen_artilleryFired",[_target,player]] call CBA_fnc_globalEvent;


private _targetPos = getPosASL _target;
private _positions = [];
for "_i" from 1 to jen_artilleryCount do { 
	private _newPosition = [
		_targetPos#0 + random [-jen_artillerySpread,0,jen_artillerySpread],
		_targetPos#1 + random [-jen_artillerySpread,0,jen_artillerySpread],
		_targetPos#2 + random [-jen_artillerySpread,0,jen_artillerySpread]
	];
	_positions pushBack _newPosition;
 };

 {
	[{
		params ["_targetPos"];
		[_targetPos] call jen_fnc_artilleryShot;
	}, [_x], ( jen_artilleryDelay * _forEachIndex )] call CBA_fnc_waitAndExecute;
 } forEach _positions;


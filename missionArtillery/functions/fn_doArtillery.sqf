params ["_target"];

["jen_artilleryFired",[_target,player]] call CBA_fnc_globalEvent;


private _targetPos = getPosASL _target;
private _positions = [];
for "_i" from 1 to jen_artilleryCount do { 
	private _newPosition = [
		_targetPos#0 + random [-50,0,50],
		_targetPos#1 + random [-50,0,50],
		_targetPos#2 + random [-50,0,50]
	];
	_positions pushBack _newPosition;
 };

 {
	[_x] call jen_fnc_artilleryShot;

 } forEach _positions;



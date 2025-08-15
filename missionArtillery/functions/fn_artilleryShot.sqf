params ["_targetPos"];

private _payload = jen_artilleryAmmo createVehicle [0,0,0];
_payLoad setVectorDirAndUp [[0,0,-1], [0,1,0]];
_targetPos set [2,5000];

_payLoad setPosASL _targetPos;
_payLoad setVelocity [
	0,
	0,
	(random [-300,-310,-320])
];
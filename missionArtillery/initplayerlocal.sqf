


// Variables for the arty
jen_artilleryAmmo = "R_230mm_HE";
jen_artilleryCount = 5;
jen_artilleryCooldown = 15;
jen_artilleryIsCoolingDown = false;
jen_artilleryBarrages = 10;
jen_artillerySpread = 50;
jen_artilleryDelay = 2;

// arty event

["jen_artilleryFired", {
	if !hasInterface exitwith{};
	params ["_target","_caller"];
	jen_artilleryIsCoolingDown = true;
	jen_artilleryBarrages = jen_artilleryBarrages - 1;
	[{
		jen_artilleryIsCoolingDown = false;
	}, [] , jen_artilleryCooldown] call CBA_fnc_waitAndExecute;

	private _coords = mapGridPosition _target;
	private _message = format ["Artillery Requested by %2: %1",_coords,(_caller getVariable ["ACE_Name",""])];

	["TaskSucceeded",["",_message]] call BIS_fnc_showNotification;
}] call CBA_fnc_addEventHandler;



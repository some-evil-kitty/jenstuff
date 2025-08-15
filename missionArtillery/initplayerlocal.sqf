// Add action
[
	player,														// Object the action is attached to
	"Artillery Barrage",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"!jen_artilleryIsCoolingDown && isNull (laserTarget player) && jen_artilleryBarrages > 1 && (leader player == player)",									// Condition for the action to be shown
	"isNull (laserTarget player) && jen_artilleryBarrages > 1",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ [laserTarget player] call jen_fnc_doArtillery },							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	6,																// Action duration in seconds
	0,																// Priority
	false,															// Remove on completion
	false	
] call BIS_fnc_holdActionAdd;


// Variables for the arty
jen_artilleryAmmo = "R_230mm_HE";
jen_artilleryCount = 5;
jen_artilleryCooldown = 15;
jen_artilleryIsCoolingDown = false;
jen_artilleryBarrages = 10;

// arty event

["jen_artilleryFired", {
	if !hasInterface exitwith{};
	params ["_target"];
	jen_artilleryIsCoolingDown = true;
	jen_artilleryBarrages = jen_artilleryBarrages - 1;
	[{
		jen_artilleryIsCoolingDown = false;
	}, [] , jen_artilleryCooldown] call CBA_fnc_waitAndExecute;

	private _coords = [getPos _target] call ace_common_fnc_getMapGridFromPos;
	private _message = format ["Artillery Requested: %1%2",_coords#0,_coords#1];

	["TaskSucceeded",["",_message]] call BIS_fnc_showNotification;
}] call CBA_fnc_addEventHandler;


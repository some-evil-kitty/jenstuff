// Add action
[
	player,														// Object the action is attached to
	"Call Artillery",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"!jen_artilleryIsCoolingDown && !isNull (laserTarget player) && jen_artilleryBarrages > 1 && (leader player == player)",									// Condition for the action to be shown
	"!jen_artilleryIsCoolingDown && !isNull (laserTarget player) && jen_artilleryBarrages > 1",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ [laserTarget player] call jen_fnc_doArtillery },							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	1,																// Action duration in seconds
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



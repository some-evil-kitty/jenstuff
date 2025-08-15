
[
	player,														// Object the action is attached to
	"Artillery Barrage",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"!jen_artilleryIsCoolingDown && isNull (laserTarget player) && jen_artilleryBarrages > 1",									// Condition for the action to be shown
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

jen_artilleryAmmo = "R_230mm_HE";
jen_artilleryCount = 5;
jen_artilleryCooldown = 15;
jen_artilleryIsCoolingDown = false;
jen_artilleryBarrages = 10;


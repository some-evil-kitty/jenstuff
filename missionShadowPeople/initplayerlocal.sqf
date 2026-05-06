player addEventHandler ["VisionModeChanged",
{
	params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
	{
		["jen_hideObjectLocal", [_x, ((_visionMode == 2))]]
	} forEach player getVariable ["jen_shadowPeople_targetingYou", []];
}];
["jen_hideObjectGlobal", {
    params ["_object", "_hide"];
    _object hideObjectGlobal _hide;
}] call cba_fnc_addEventHandler;

["jen_hideObjectLocal", {
    params ["_object", "_hide"];
    _object hideObject _hide;
}] call cba_fnc_addEventHandler;

["jen_shadowPeople_hurtTarget", jen_fnc_hurt] call cba_fnc_addEventHandler;

["jen_shadowPeople_beingTargeted", jen_fnc_beingTargeted] call cba_fnc_addEventHandler;

["jen_jetpacks_core_jetpackEvent", {
	params ["_unit","_externalCondition","_acceleration","_resistance","_fuelCoef","_heatCoef","_coolCoef","_strafeCoef","_hoverCoef","_ascensionCoef","_jumpCoef","_fuelCapacity"];
    private _shadowPeople = _unit getVariable ["jen_shadowPeople_targetingYou", []];
    _externalCondition = (_shadowPeople findIf {_unit distance _x < 30}) != -1;
    _this set [1,_externalCondition]
}] call CBA_fnc_addEventHandler;

jen_shadowPeople_searchRadius = 100;
jen_shadowPeople_side = east;
jen_shadowPeople_class = "B_VR_Soldier_F"; //pretty sure this is right
jen_shadowpeople_painPerHit = 0.34;

private _config = configFile >> "CfgVehicles" >> jen_shadowPeople_class;
jen_shadowPeople_selections = getArray (_config >> "HiddenSelections");
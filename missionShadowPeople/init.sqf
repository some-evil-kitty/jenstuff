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

["jen_shadowPeople_createShadowPerson", jen_fnc_createShadowPerson] call cba_fnc_addEventHandler;
["jen_shadowPeople_playSound", {
    params ["_sound"];
    playSound _sound;
}] call cba_fnc_addEventHandler;

["jen_jetpacks_core_jetpackEvent", {
	params ["_unit","_externalCondition","_acceleration","_resistance","_fuelCoef","_heatCoef","_coolCoef","_strafeCoef","_hoverCoef","_ascensionCoef","_jumpCoef","_fuelCapacity"];
    private _shadowPeople = _unit getVariable ["jen_shadowPeople_targetingYou", []];
    _externalCondition = (_shadowPeople findIf {_unit distance _x < 30}) == -1;
    _this set [1,_externalCondition]
}] call CBA_fnc_addEventHandler;

jen_shadowPeople_searchRadius = 100;
jen_shadowPeople_side = east;
jen_shadowPeople_class = "B_Soldier_VR_F"; //pretty sure this is right
jen_shadowpeople_painPerHit = 0.34;
jen_shadowPeople_resurrect = true;

["CAManBase", "Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects", "_shot", "_real"];
    if !jen_shadowPeople_resurrect exitWith {};
    [{
        params ["_unit", "_killer"];
        ["jen_shadowPeople_createShadowPerson", position _unit, _killer] call cba_fnc_targetEvent;
        ["jen_shadowPeople_playSound", "jen_demonScream", _killer] call cba_fnc_targetEvent;
    }, [_unit, _killer], random [jen_shadowPeople_minResurrectTime, jen_shadowPeople_maxResurrectTime/2, jen_shadowPeople_maxResurrectTime]] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

private _config = configFile >> "CfgVehicles" >> jen_shadowPeople_class;
jen_shadowPeople_selections = getArray (_config >> "HiddenSelections");
params ["_position"];

private _newGroup = createGroup jen_shadowPeople_side;

private _unit = createAgent [jen_shadowPeople_class, _position, [], 0, "NONE"];
/*
private _unit = _newGroup createUnit [jen_shadowPeople_class, _position,[], 0, "NONE"];

_newGroup setCombatBehaviour "CARELESS";
_newGroup setSpeedMode "FULL";

_unit setCombatBehaviour "CARELESS";
*/
_unit setUnitPos "UP";

_unit setAnimSpeedCoef 1.2;

_unit removeAllEventHandlers "HandleDamage";

{
    _unit setObjectTextureGlobal [_x, "#(argb,8,8,3)color(0,0,0,1,ca)"];
    _unit setObjectMaterialGlobal [_x, ""];
} forEach jen_shadowPeople_selections;

[_unit, true] call ace_headless_fnc_blacklist;

_unit addEventHandler ["HandleDamage", {
    _this call jen_fnc_handleShadowDamage;
}];

["jen_hideObjectGlobal", [_unit, true]] call cba_fnc_serverEvent;

[_unit] call jen_fnc_addShadowPersonAI;


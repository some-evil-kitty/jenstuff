params ["_position"];

private _newGroup = createGroup jen_shadowPeople_side;

private _unit = _newGroup createUnit [jen_shadowPeople_class, _position];

_unit setCombatBehaviour "CARELESS";

_unit setAnimSpeedCoef 1.3;

_unit removeAllEventHandlers "HandleDamage";

_unit addEventHandler ["HandleDamage", {
    _this call jen_fnc_handleShadowDamage;
}];


["jen_hideObjectGlobal", _unit] call cba_fnc_serverEvent;

[_unit] call jen_fnc_addShadowPersonAI;


jen_warningMarkers = createHashMap;
jen_artyWarning_debounce = false;

addMissionEventHandler ["ArtilleryShellFired", {
    params ["_vehicle", "_weapon", "_ammo", "_gunner", "_instigator", "_artilleryTarget", "_targetPosition", "_shell"];
    if (side _instigator getFriend side ace_player < 0.6;) exitWith {};
    private _text = "Artillery Incoming!";
    private _icon = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
    private _colReal = [0.7,0,0,1];
    private _markerName = ("knd_artyMarker" + (str CBA_missionTime));
    _targetPosition set [2,0];
    jen_warningMarkers set [_markerName, [_colReal,_icon,_text,_targetPosition, 200]];
    if (_targetPosition distance ace_player < 200) then {
        call jen_fnc_doArtyWarning;
    };
    [{params ["_shell"]; !alive _shell}, {
        params ["_shell","_markerName"];
        jen_warningMarkers deleteAt _markerName;
    }, [_shell, _markerName], 120, {
        params ["_shell","_markerName"];
        jen_warningMarkers deleteAt _markerName;
    }] call CBA_fnc_waitUntilAndExecute;
}];

addMissionEventHandler ["Draw3d", {
    {
        _y params ["_colReal","_icon","_text","_pos",["_maxDist", 1e10]];
         private _scale = (1 max 1/(ace_player distance _pos)) min 2; 
         _colReal set [3,0.8];
         drawIcon3D [_icon, _colReal, _pos, _scale, _scale, 0, _text]; 
    } forEach jen_warningMarkers; 
}];
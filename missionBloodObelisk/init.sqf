["jen_bloodObelisk_startBleeding", jen_fnc_startBleeding] call CBA_fnc_addEventHandler;
["jen_bloodObelisk_sendBlood", jen_fnc_sendBlood] call cba_fnc_addEventHandler;
["jen_bloodObelisk_endBleeding", jen_fnc_endBleeding] call cba_fnc_addEventHandler;

jen_bloodObelisk_satiationThreshold = 6;
jen_bloodObelisk_drainRate = 0.2;
jen_bloodObelisk_maxRange = 4;
jen_bloodObelisk_bloodPacketSize = 0.5;
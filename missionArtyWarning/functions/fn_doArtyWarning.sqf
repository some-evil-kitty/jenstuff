if jen_artyWarning_debounce exitWith {};
jen_artyWarning_debounce = true;
titleText ["<t color='#660000' size='2'>You are being targeted by enemy artillery!</t>", "PLAIN DOWN", -1, true, true];
playSoundUI ["Alarm", 0.1];
[{jen_artyWarning_debounce = false},[],30] call CBA_fnc_waitAndExecute;
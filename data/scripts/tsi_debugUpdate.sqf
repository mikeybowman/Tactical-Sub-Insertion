/*
================================================================================
   TSI Sub Insert Mod
   Author      : Tsardev
   Version     : 1.0
   Description : This file is part of the TSI Sub Insert Mod for Arma 3.
                Provides underwater insertion functionality via a designated
                submarine asset.
================================================================================
*/


/*
    tsi_debugUpdate.sqf
    Updates the debug text on the TSI debug GUI.
    Parameter: _this select 0 is the string message to display.
*/

if (isNil "TSI_DEBUG_ENABLED" || !TSI_DEBUG_ENABLED) exitWith {};

private _debugText = _this select 0;

if (isNil "TSI_DEBUG_DISPLAY" || isNull TSI_DEBUG_DISPLAY) then {
    TSI_DEBUG_DISPLAY = findDisplay TSI_DEBUG_DIALOG_ID;
};

if (!isNull TSI_DEBUG_DISPLAY) then {
    private _ctrl = TSI_DEBUG_DISPLAY displayCtrl 1100;
    _ctrl ctrlSetStructuredText parseText _debugText;
};

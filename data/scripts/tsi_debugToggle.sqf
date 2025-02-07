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
    tsi_debugToggle.sqf
    Toggles the TSI debug GUI on/off.
*/

if (isNil "TSI_DEBUG_ENABLED") then {
    TSI_DEBUG_ENABLED = false;
    TSI_DEBUG_DISPLAY = nil;
};

if (TSI_DEBUG_ENABLED) then {
    // If debug is enabled, close the debug display.
    if (!isNull TSI_DEBUG_DISPLAY) then {
        closeDisplay TSI_DEBUG_DIALOG_ID;
        TSI_DEBUG_DISPLAY = nil;
    };
    TSI_DEBUG_ENABLED = false;
} else {
    // Open the debug dialog.
    createDialog "TSI_DebugDialog";
    TSI_DEBUG_DISPLAY = findDisplay TSI_DEBUG_DIALOG_ID;
    TSI_DEBUG_ENABLED = true;
};

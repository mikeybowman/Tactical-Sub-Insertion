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
    tsi_initObject.sqf
    This script is to be placed in an object’s init field.
    It adds an action “Insert via Sub” that opens the Sub Insert dialog.
*/

// Verify that the submarine asset exists (must be placed and named HAFM_ASSET)
if (isNil "HAFM_ASSET") then {
    hint "[TSI] Error: Submarine asset (HAFM_ASSET) not found!";
    exitWith {};
};

// Add the action to open the dialog
this addAction ["Insert via Sub", {
    // Open the dialog defined in tsi_dialog.hpp
    createDialog "TSI_SubInsertDialog";
    
    // Populate the depth selection combo box (idc 1100)
    private _display = findDisplay TSI_DIALOG_ID;
    if (!isNull _display) then {
        private _combo = _display displayCtrl 1100;
        lbClear _combo;
        lbAdd [_combo, "25m"];
        lbAdd [_combo, "50m"];
        lbAdd [_combo, "100m"];
        lbSetCurSel [_combo, 0];  // Default to the first option (25m)
    };
}];

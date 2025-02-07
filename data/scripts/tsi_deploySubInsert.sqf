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
    tsi_deploySubInsert.sqf
    This script is executed when the Deploy button is pressed in the Sub Insert Dialog.
*/

// Close the dialog immediately.
closeDialog 0;

// Get the dialog display (its idd is defined in tsi_dialog.hpp as TSI_DIALOG_ID)
private _display = findDisplay TSI_DIALOG_ID;
if (isNull _display) exitWith { hint "[TSI] Dialog not found."; };

// Retrieve the combo box control (idc 1100) and get the current selection.
private _combo = _display displayCtrl 1100;
private _sel = lbCurSel _combo;

// Determine depth (in meters) based on selection.
private _depth = switch (_sel) do {
    case 0: {25};
    case 1: {50};
    case 2: {100};
    default {25};
};

// Get the submarine’s position (HAFM_ASSET) and calculate the spawn position.
private _subPos = getPosASL HAFM_ASSET;
private _spawnPos = [_subPos select 0, _subPos select 1, (_subPos select 2) - _depth];

// Check if the spawn position is viable (i.e. underwater).
private _viable = false;
if (isFile "\tsi\data\scripts\tsi_depthCheck.sqf") then {
    _viable = [ _spawnPos, _depth ] execVM "\tsi\data\scripts\tsi_depthCheck.sqf";
} else {
    _viable = surfaceIsWater _spawnPos;
};

if (!_viable) then {
    hint format "[TSI] Depth of %1m is not viable at this location.", _depth;
    exitWith {};
};

// Transition effect: simple 10‑second fade via titleText.
titleText ["[TSI] Deploying via Sub...", "black", 10];
sleep 10;

// Reposition the player to the calculated underwater spawn position.
player setPosASL _spawnPos;
hint format "[TSI] Deployed at %1m depth.", _depth;

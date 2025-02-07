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


// tsi_dialog.hpp

#define TSI_DIALOG_ID 12345

class TSI_SubInsertDialog {
    idd = TSI_DIALOG_ID;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class TSI_BG: RscText {
            idc = 1000;
            x = 0.35; y = 0.3;
            w = 0.3; h = 0.25;
            colorBackground[] = {0,0,0,0.8};
        };
    };
    
    class controls {
        class TSI_Title: RscText {
            idc = 1001;
            text = "Insert via Sub - Depth Selection";
            x = 0.36; y = 0.31;
            w = 0.28; h = 0.05;
        };
        class TSI_DepthCombo: RscCombo {
            idc = 1100;
            x = 0.36; y = 0.38;
            w = 0.28; h = 0.05;
        };
        class TSI_DeployButton: RscButton {
            idc = 1200;
            text = "Deploy";
            x = 0.36; y = 0.45;
            w = 0.28; h = 0.06;
            action = "[] execVM ""\tsi\data\scripts\tsi_deploySubInsert.sqf"";";
        };
        class TSI_CancelButton: RscButton {
            idc = 1201;
            text = "Cancel";
            x = 0.36; y = 0.52;
            w = 0.28; h = 0.06;
            action = "closeDialog 0;";
        };
    };
};

class RscText {
    type = 0;
    idc = -1;
    style = 0;
    x = 0; y = 0;
    w = 0.3; h = 0.05;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
};

class RscCombo {
    type = 4;
    idc = -1;
    style = 0;
    x = 0; y = 0;
    w = 0.3; h = 0.04;
    font = "PuristaMedium";
    sizeEx = 0.04;
    rowHeight = 0.04;
    colorBackground[] = {0,0,0,0.7};
    colorText[] = {1,1,1,1};
};

class RscButton {
    type = 1;
    idc = -1;
    style = 2;
    x = 0; y = 0;
    w = 0.1; h = 0.05;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0.2,0.2,0.2,1};
    colorBackgroundActive[] = {0.3,0.3,0.3,1};
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
};

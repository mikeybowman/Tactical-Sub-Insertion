------------------------------------------------------------
#                Tactical Sub Insert
------------------------------------------------------------

Tactical Sub Insert (TSI)
Version: 1.0
Author: Tsardev

------------------------------------------------------------
### Overview
------------------------------------------------------------
TSI is a stand-alone Arma 3 mod that enables players to 
“insert” (spawn) underwater via a designated submarine asset. This mod provides 
a fully interactive GUI allowing players to select an insertion depth (25m, 50m, 
or 100m) via a mouse-wheel–style combo box, and then deploy themselves after a 
smooth 10-second transition effect. The mod also features an integrated debug GUI 
that can be toggled on/off to display real-time error messages and script status 
on the right–middle of the screen.

------------------------------------------------------------
### Folder Structure & Files
------------------------------------------------------------
```hpp
tsi\
 └── data\
      ├── scripts\
      │     tsi_modstart.sqf          - Main mod startup script; initializes dialogs and debug variables.
      │     tsi_initObject.sqf         - Object initialization script; adds the “Insert via Sub” action.
      │     tsi_deploySubInsert.sqf    - Handles depth selection, viability check, transition effect, and deployment.
      │     tsi_depthCheck.sqf         - (Optional) Advanced depth viability check using a raycast.
      │     tsi_debugToggle.sqf        - Toggles the debug GUI on and off.
      │     tsi_debugUpdate.sqf        - Updates the debug display with error messages and status info.
      └── dialog\
            tsi_dialog.hpp             - GUI definitions for the Sub Insert dialog (depth selection, deploy, cancel).
            tsi_debugDialog.hpp        - GUI definitions for the debug display.
```
------------------------------------------------------------
### Mod Functions & How It Works
------------------------------------------------------------
1. Mod Startup (tsi_modstart.sqf):
   - Runs when the mod is loaded.
   - Includes the dialog header files (both for the main and debug dialogs) and initializes global debug variables.
   - Logs a startup message to Arma 3's diag_log confirming the mod has started.

2. Object Interaction (tsi_initObject.sqf):
   - This script is executed from an object's init field.
   - Checks for the designated submarine asset (named "HAFM_ASSET").
   - Adds an "Insert via Sub" action to the object. When the player selects it, the depth selection dialog opens.
   - Populates the combo box (mouse-wheel style) with three depth options: "25m", "50m", and "100m".

3. Depth Selection & Deployment (tsi_deploySubInsert.sqf):
   - Triggered when the player clicks "Deploy" in the dialog.
   - Retrieves the chosen depth from the combo box and calculates the underwater spawn position based on the position of "HAFM_ASSET".
   - Performs a viability check to ensure the selected depth is underwater. This check uses either a basic method (surfaceIsWater) or an advanced check in tsi_depthCheck.sqf.
   - Initiates a 10-second transition effect (using a fade message via titleText) before repositioning the player underwater.
   - Sends debug messages throughout the process using tsi_debugUpdate.sqf.

4. Debug GUI (tsi_debugToggle.sqf & tsi_debugUpdate.sqf):
   - The debug GUI is defined in tsi_debugDialog.hpp and displays messages on the right–middle of the screen.
   - Toggle the debug display on/off by executing tsi_debugToggle.sqf (this can be bound to a key or action).
   - The debug display is updated with error messages and the current function status, assisting in testing and troubleshooting.

5. Advanced Depth Check (tsi_depthCheck.sqf – Optional):
   - Uses a raycast to determine the water depth above the calculated spawn position.
   - Returns true if the water depth is equal to or greater than the selected depth; otherwise, returns false.
   - This script can be modified or omitted if you prefer using only the basic water surface check.

------------------------------------------------------------
### How to Use the Mod
------------------------------------------------------------
1. Prepare Your Mission:
   - Place your submarine asset in the mission and set its variable name to "HAFM_ASSET".
   - Place an interactable object (e.g., a terminal or console) in your mission. In the object's init field, add:
```hpp
         [this] execVM "\tsi\data\scripts\tsi_initObject.sqf";
```
   - Ensure that the folder structure (with the "tsi" folder containing "data\scripts" and "data\dialog") is preserved when packing the mod into a .pbo.

2. Running the Mod:
   - When the mission starts, tsi_modstart.sqf initializes the mod.
   - The player interacts with the object that contains the mod action. When they select "Insert via Sub", the depth selection dialog opens.
   - The player selects a desired insertion depth (25m, 50m, or 100m) from the combo box and clicks "Deploy".
   - The mod checks that the chosen depth is viable (i.e., underwater) and then initiates a 10-second transition effect.
   - After the transition, the player is repositioned underwater relative to the submarine (HAFM_ASSET).

3. Debugging (Optional):
   - To toggle the debug GUI on or off, execute tsi_debugToggle.sqf. This can be bound to a key or executed via an in-game action.
   - The debug display shows real-time messages (errors and current function status) which is useful during development and troubleshooting.

------------------------------------------------------------
### Final Notes
------------------------------------------------------------
- Customization: You can modify GUI layouts, depth options, transition effects, and debug messages by editing the respective .sqf and .hpp files in the tsi\data\scripts and tsi\data\dialog folders.
- Troubleshooting: If the mod does not behave as expected, ensure that the submarine asset is correctly placed and named, and that your folder structure within the .pbo matches the above structure.
- Enjoy: This mod provides a unique underwater insertion mechanic to enhance your Arma 3 experience. Happy diving and modding!

------------------------------------------------------------
## License
This mod is licensed using the [Arma Public License Share Alike (APL-SA)](https://www.bohemia.net/community/licenses/arma-public-license-share-alike)
------------------------------------------------------------

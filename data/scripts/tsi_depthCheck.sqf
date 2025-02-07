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
    tsi_depthCheck.sqf
    Checks if the given spawn position is underwater with at least the specified depth.
    
    Parameters:
      _this select 0 : _spawnPos (array) – The calculated spawn position.
      _this select 1 : _minDepth (number) – Minimum required depth (25, 50, or 100).
      
    Returns:
      true if viable, false otherwise.
*/

private _spawnPos = _this select 0;
private _minDepth = _this select 1;

// Cast a ray upward from the spawn position to locate the water surface.
private _ray = lineIntersectsSurfaces [_spawnPos, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 500], ["water"]];
private _waterSurfaceZ = (count _ray > 0) ? (((_ray select 0) select 2)) : (_spawnPos select 2);
private _actualDepth = _waterSurfaceZ - (_spawnPos select 2);
(_actualDepth >= _minDepth)

#include <macro.h>
/*
	File: fn_initMissions.sqf
	AKA: life_fnc_initMissions
	Author: Patrick "SrgFlip" Reister
	
	Description:
	Is run at server startup (and only on the server), use this as bootstrap for any functionality which needs to work independently from 
	any player. I recommend just putting a spawn or call to another function here if there is a lot of code to run.
*/

// spawns (first so we get those running before calls will block everything up)
[] spawn life_fnc_initFederalReserve;
[] spawn life_fnc_initCasino;

// calls

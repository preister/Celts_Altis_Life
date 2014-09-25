#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn    //basic cop
{
 while {true} do
 {
  waitUntil {uniform player == "U_Rangemaster"};
  player setObjectTextureGlobal [0,"textures\police_uniform_co.paa"];
  waitUntil {uniform player != "U_Rangemaster"};
 };
};

[] spawn     //Hat
{
 while {true} do
 {
  waitUntil {uniform player == "H_MilCap_mcamo"};
  player setObjectTextureGlobal [0,"textures\police_cap_co.paa"];
  waitUntil {uniform player != "H_MilCap_mcamo"};
 };
};

[] spawn     //Vest
{
 while {true} do
 {
  waitUntil {uniform player == "Vest_V_PlateCarrier2_rgr"};
  player setObjectTextureGlobal [0,"textures\V_PlateCarrier2_rgr"];
  waitUntil {uniform player != "Vest_V_PlateCarrier2_rgr"};
 };
};
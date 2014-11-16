/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_crime"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_crime = _ui displayCtrl 23520;

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;
//cops dont need to see their bounty
if !(playerSide == west) then {
	//Update Crime
	private["_format"];
	_format = "0k";
	_crime ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.400];
	//lets avoid dividing 0
	if (life_player_bounty != 0) then {
		if (life_player_bounty > 999999) then {
			_format = format["%1kk", (life_player_bounty / 100000)];
		} else {
			_format = format["%1k", (life_player_bounty / 1000)];
		};
	};
	_crime ctrlSetText _format;
	_crime ctrlCommit 0;
};
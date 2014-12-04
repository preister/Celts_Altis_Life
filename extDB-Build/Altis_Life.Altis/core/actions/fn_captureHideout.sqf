#include <macro.h>
/*
	File: fn_captureHideout.sqf
	AKA: life_fnc_captureHideout
	Author: Bryan "Tonic" Boardwine
	Edit: Patrick "SrgFlip" Reister
	
	Description:
	Wrapper for captureLocation which takes care of the Hideout specific configuration and messages. 
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};

if !([_hideout,_cpRate] call life_fnc_captureLocation) exitWith {}; //capture failed :(

titleText["Hideout has been captured.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",grpPlayer,true];
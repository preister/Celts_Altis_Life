#include <macro.h>
/*
	File: fn_captureLocation.sqf
	AKA: life_fnc_captureLocation
	Author: Patrick "SrgFlip" Reister
	
	Description:
	CaptureLocation takes care of a player capturing a flag and returns true of false if the capture was successful 
*/
private["_group","_location","_cpRate","_cP","_progressBar","_title","_titleText","_ui"];
_location = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_cpRate [_this,0,0,[0]] call BIS_fnc_param;

if (Nil == _location) OR (_cpRate == 0) exitWith {}; //broken params
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Capturing";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_location setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_location setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_location setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_location setVariable["inCapture",false,true];};
};

//Kill the UI display
5 cutText ["","PLAIN"];
player playActionNow "stop";
//check for various states
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_location setVariable["inCapture",false,true]; false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_location setVariable["inCapture",false,true]; false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_location setVariable["inCapture",false,true]; false;};
life_action_inUse = false;
//ok we got here so everything went ok :)
true;
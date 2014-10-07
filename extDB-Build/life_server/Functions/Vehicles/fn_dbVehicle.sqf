/*
	File: fn_dbVehicle.sqf
	Author: Patrick 'SrgFlip' Reister
	
	Description:
	Handles all db related calls in regards of vehicles, this way you can keep you code clean and
	focused
	
	This includes all the data checking code
*/
private["_call","_data","_query"];
_call = [_this,0,"",[""]] call BIS_fnc_param;
_data = [_this,1,[],[[]] call BIS_fnc_param;
_query = "";
_mode = 0;
_multiarr = false;
switch(_call) do {
	case "insert": {
		if(6 != count _data) exitWith {};
		private["_uid","_side","_type","_className","_color","_plate"];
		_uid = _data select 0;
		_side = _data select 1;
		_type = _data select 2;
		_className = _data select 3;
		_color = _data select 4;
		_plate = _data select 5;
		if(_uid == "" OR _side == "" OR _type == "" OR _className == "" OR _color == -1 OR _plate == -1) exitWith {};
		_query = format["INSERT INTO vehicles (side, classname, type, pid, alive, active, inventory, color, plate) VALUES ('%1', '%2', '%3', '%4', '1','1','""[]""', '%5', '%6')",_side,_className,_type,_uid,_color,_plate];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_mode = 2;
	};
	
	case "select": {
		if(2 != count _data) exitWith{};
		private["_vid","_pid"];
		_vid = _data select 0;
		_pid = _data select 1;
		if(_vid == -1 OR _pid == "") exitWith {};
		_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];
		_mode = 2;
	};
	
	case "retrieve": {
		if(2 != count _data) exitWith{};
		private["_vid","_pid"];
		_vid = _data select 0;
		_pid = _data select 1;
		if(_vid == -1 OR _pid == "") exitWith {};
		_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_mode = false;
	};
	
	case "store": {
		if(2 != count _data) exitWith{};
		private["_vid","_plate"];
		_vid = _data select 0;
		_plate = _data select 1;
		if(_vid == -1 OR _plate == "") exitWith {};
		_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_pid,_plate];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_mode = 1;
	};
	
	case "sell": {
		if(2 != count _data) exitWith{};
		private["_vid","_pid"];
		_vid = _data select 0;
		_pid = _data select 1;
		if(_vid == -1 OR _pid == "") exitWith {};
		_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_pid,_vid];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_mode = 1;
	};
	
	case "delete": {
		if(2 != count _data) exitWith{};
		private["_vid","_plate"];
		_vid = _data select 0;
		_plate = _data select 1;
		if(_vid == -1 OR _plate == "") exitWith {};
		_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_mode = 1;
	};
	
	case "infoall" : {
		if(3 != count _data) exitWith{};
		private["_pid","_side","_type"];
		_pid = _data select 0;
		_side = _data select 1;
		_type = _data select 2;
		if(_pid == "" OR _side == "" OR _type == "") exitWith {};
		_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];
		_mode = 2;
		_multiarr = true;
	};
};
if ("" == _query) exitWith {}

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,_mode,_multiarr] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

//and last but not least give it back
_queryResult;
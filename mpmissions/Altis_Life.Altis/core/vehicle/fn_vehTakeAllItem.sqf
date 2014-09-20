#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint "The vehicle either doesn't exist or is destroyed."};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint "You need to select an item!";};
//item selected in the trunk
_ctrl = ctrlSelData(3502);
//number from the input field on the left side - hardcoded for the initial implementation
_num = 1;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

//the index number of the selected item in trunk
_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call fnc_index;
//all items in the trunk
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
//the amount of the selected item present in the trunk
_value = _data select _index select 1;
while {!(_num > _value)} do
{
	//leaving in the original check just to make sure stuff doesnt get out of hand
	if(_num > _value) exitWith {hint "The vehicle doesn't have that many of that item."};
	_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_num == 0) exitWith {hint "Your inventory is full."};
	_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
	if(_ctrl == "money") then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		
		life_cash = life_cash + _num;
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	}
		else
	{
		if([true,_ctrl,_num] call life_fnc_handleInv) then
		{
			if(_num == _value) then
			{
				_data set[_index,-1];
				_data = _data - [-1];
			}
				else
			{
				_data set[_index,[_ctrl,(_value - _num)]];
			};
			life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
			[life_trunk_vehicle] call life_fnc_vehInventory;
		}
			else
		{
			hint "Couldn't add to your inventory, are you full?";
		};
	};
};
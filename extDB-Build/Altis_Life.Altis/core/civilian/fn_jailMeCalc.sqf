/*
	File: fn_jailMe.sqf
	Author SrgFlip
	
	Description:
	Sorts the jail time array from smallest to largest time separated out as max time
*/
private["_sortedJailTimeArray","_maxJailTime","_jailTime","_upToBounty","_iJailTime","_jailtime_array"];
_jailtime_array = [_this,0,[],[[]]] call BIS_fnc_param;
//lets calculate us some jail time - first make sure the list in sorted correctly, makes searching easier
//using a Insertion sort is maybe not the most efficient but we can just bake it once at startup
//additionally there is also a need to take care of the single field max value
_sortedJailTimeArray = [];
_maxJailTime = 0;
{
	//make sure we have 2 fields
	if (count _x == 2) then {
		_jailTime = _x select 0;
		_upToBounty = _x select 1;
		//we need an initial field to start with
		if (count _sortedJailTimeArray == 0) then {
			_sortedJailTimeArray set [0, [_jailTime, _upToBounty]];
		}
		else {
		    //http://en.wikipedia.org/wiki/Insertion_sort
			//sorry for this awfully complex bit of code but having the array not in order makes setting the time even more complicated
			for "_i" from count _sortedJailTimeArray to 0 do {
				_iJailTime = (_sortedJailTimeArray select _i) select 0;
				//if the current value is smaller that overall value we need to insert the overall value behind it and are done
				if(_iJailTime < _jailTime) exitWith {_sortedJailTimeArray set [_i + 1,[_jailTime,_upToBounty]]};
				//if we've reached the end of the array there is obviously nothing smaller so we are done as well
				if(_i == 0) exitWith {_sortedJailTimeArray set [0,[_jailTime,_upToBounty]]};
			};
		};
	}
	else {
		_maxJailTime = _x; //in case somebody created a empty field etc it will just break here
	};
}forEach _jailtime_array;
//in case no max value was set we take the largest time tin the array
if(_maxJailTime == 0) then {
	_maxJailTime = (_sortedJailTimeArrays select (count _sortedJailTimeArrays -1)) select 0;
};
//lets return this nicely so we can bake it into a static and don't need to worry about this any more
[_sortedJailTimeArray, _maxJailTime];

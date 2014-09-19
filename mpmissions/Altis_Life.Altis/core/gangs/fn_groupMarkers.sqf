/*
	File: fn_groupMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks group units on the map. Only initializes when the actual map is open.
*/
private["_markers","_units"];
_markers = [];
_units = [];

sleep 0.5;
if(visibleMap) then {
	{
		if((side _x == civilian) && (player != _x)) then {
			_units set[count _units,_x];
		}
	} forEach (units(group player)); //Fetch list of units
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
	
		_markers set[count _markers,[_marker,_x]];
	} foreach _units;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_units = [];
};
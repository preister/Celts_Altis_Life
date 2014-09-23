/*
	File: attemptedAutoTheft.sqf
	Author: Dmitry Yuri [Blackforest Gaming]
	Description:
	Adds or appends a unit to the wanted list.
*/

_Crim = cursorTarget;
if (isPlayer _crim) then {						//Target needs to be a player and not a building or a vehicle
if (alive _Crim) then {							//Target needs to be alive
if ((_Crim distance player) < 5) then {			//Target needs to be within 5 metres
if (Side _Crim != west) then {					//Target needs to be a civ and not a cop
[[getPlayerUID (cursorTarget),name (cursorTarget),"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
hint format["you have added %1 to the wanted list for Attempted Auto Theft", name _Crim];
} else {hint format["%1 is a police officer, you cannot add him to the wanted list.", name _Crim];};
} else {hint "You need to be within 5M of the target."};
} else {hint "The target needs to be alive!."}
} else {hint "You need to look at a player for this to work";};

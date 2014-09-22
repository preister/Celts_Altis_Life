/*
File: fn_gatherCorn.sqf

Description:
Gathering corn
*/
private["_sum"];
_sum = ["corn",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Gathering corn...","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"corn",1] call life_fnc_handleInv)) then
{
titleText["You have gathered some corn.","PLAIN"];
};
};

life_action_inUse = false;
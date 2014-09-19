/*
File: fn_gatherMeth.sqf

Description:
Stealing Meth
*/
private["_sum"];
_sum = ["methu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Gathering ingredients...","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"methu",1] call life_fnc_handleInv)) then
{
titleText["You have gathered some ingredients.","PLAIN"];
};
};

life_action_inUse = false;
#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = [
			["U_Rangemaster","Cop Uniform",25]
		];
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,100]];
			_ret set[count _ret,["H_Beret_02",nil,100]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = [
			["V_Rangemaster_belt",nil,800]
		];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Bergen_blk",nil,500],
			["B_AssaultPack_blk",nil,500],
			["B_FieldPack_blk",nil,500],
			["B_OutdoorPack_blk",nil,500]			
		];
	};
};

_ret;
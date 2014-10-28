/*
	File: fn_clothing_press.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Dubbz261
	Description:
	Master configuration file for Press shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Freelance Press Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Journalist",nil,5000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_press",nil,850]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:x 	
	{
		[
			["V_Press_F",nil,4500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_oucamo",nil,3000]
		];
	};
};
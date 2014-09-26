/*
	File: fn_clothing_pilot.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Pilot shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Pilot Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_I_HeliPilotCoveralls",nil,3000],
			["U_B_HeliPilotCoveralls",nil,3000],
			["U_B_PilotCoveralls",nil,5000]
		];	
	};
	
	//Hats
	case 1:
	{
		[
			["H_PilotHelmetHeli_B",nil,750],
			["H_CrewHelmetHeli_B",nil,2500],
			["H_PilotHelmetFighter_B",nil,5000]		
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
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};
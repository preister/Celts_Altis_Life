#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["HandGrenade_Stone","Flashbang",1700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,5000],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles_OPFOR",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,5000],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_oucamo",nil,3000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["SMG_02_F","Stun Gun",30000],
						["30Rnd_9x21_Mag","Rubber bullets",150],
						//["muzzle_snds_L",nil,650],
						["arifle_Katiba_C_F",nil,20000],
						["30Rnd_65x39_caseless_green",nil,100],
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["acc_flashlight",nil,750],
						["optic_ACO_grn_smg",nil,950],
						["optic_Aco_smg",nil,1200],
						["optic_Hamr",nil,2500],
						["Chemlight_blue",nil,300],
						["HandGrenade_Stone","Flashbang",2500]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not a member of SWAT!"};
			default
			{
				["Altis SWAT Shop",
					[
						["SMG_02_F","Stun Gun",30000],
						["30Rnd_9x21_Mag","Rubber bullets",150],
						//["muzzle_snds_L",nil,650],
						["arifle_Katiba_C_F",nil,20000],
						["arifle_Katiba_GL_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,150],
						["UGL_FlareWhite_F",nil,150],
						["1Rnd_SmokeBlue_Grenade_shell",nil,150],
						["arifle_MX_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["srifle_GM6_SOS_F",nil,35000],
						["5Rnd_127x108_APDS_Mag",nil,300],						
						["acc_flashlight",nil,750],					
						["optic_ACO_grn_smg",nil,950],
						["optic_Aco_smg",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_Nightstalker",nil,2500],
						["optic_tws_mg",nil,3000],
						["acc_pointer_IR",nil,1500],
						["HandGrenade_Stone","Flashbang",2500],
						["Rangefinder",nil,2500],
						["Chemlight_blue",nil,300],
						["MineDetector",nil,1000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Guns 'R' Us",
					[
						["hgun_Rook40_F",nil,6500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_ACPC2_F",nil,11500],
						["9Rnd_45ACP_Mag",nil,45],
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,20000],
						["30Rnd_556x45_Stanag",nil,200],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,275],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,325],
						["srifle_DMR_01_F",nil,50000],
						["10Rnd_762x51_Mag",nil,500],
						["arifle_MXC_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag",nil,125],
						["SMG_01_F",nil,20000],
						["30Rnd_45ACP_Mag_SMG_01",nil,125],
						["srifle_LRR_SOS_F",nil,100000],
						["7Rnd_408_Mag",nil,5000],
						["optic_ACO_grn_smg",nil,950],
						["optic_ACO_grn",nil,1500],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["HandGrenade",nil,50000],
				        ["ItemGPS",nil,100],
				        ["ToolKit",nil,5000],
				        ["FirstAidKit",nil,150],
				        ["NVGoggles_INDEP",nil,2000],
						["Rangefinder",nil,2500],
						["optic_NVS",nil,2500]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_Pistol_heavy_01_MRD_F",nil,3500],
						["hgun_Pistol_heavy_02_Yorris_F",nil,3500],
						["6Rnd_45ACP_Cylinder",nil,50],
						["hgun_ACPC2_F",nil,4500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,9500],
						["SMG_02_F",nil,12000],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,18500],
						["30Rnd_45ACP_Mag_SMG_01",nil,125],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["V_BandollierB_khk",nil,2500],
						["NVGoggles",nil,2000],
						["U_NikosBody",nil,2000]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,5000],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000]				
			]
		];
	};
};

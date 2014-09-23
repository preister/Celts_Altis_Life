/*
	File: tools.sqf
	Author: Fusion13
	Modified for altis life by: Dmitry Yuri [Blackforest Gaming]
	
	Description:
	sets up the menu
*/
//_pathtotools = "scripts\fusionsmenu\admin\tools\";
//_pathtoweapon = "scripts\fusionsmenu\admin\weapons\";
_pathtovehicles = "scripts\fusionsmenu\admin\wanted\";
//_pathtosoldier= "scripts\fusionsmenu\admin\spawn\";
//_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
//_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';
//_EXECscript6 = 'player execVM "'+_pathtosoldier+'%1"';


if (playerSide == west) then {				//this just checks to see if your a cop. i havent yet experimented with cop level but i guess it would work in this if statement.
	if (playerSide == west) then {			//or you could try just adding in a licence. that would probably be easiest.
		adminmenu =
		[
			["Police Menu",true],
				["Wanted Tools", [2], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};

//ToolsMenu =		//disabled
//[
//	["Admin Tools",true],
//			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
//];

//WeaponMenu =	//disabled
//[
//	["Police Tools",true],
//			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
//];

VehicleMenu = 
[
	["Wanted Menu",true],
		["Kidnapping", [2],  "", -5, [["expression", format[_EXECscript5,"kidnapping.sqf"]]], "1", "1"],
		["Attempted Kidnapping", [3],  "", -5, [["expression", format[_EXECscript5,"attemptedKidnapping.sqf"]]], "1", "1"],
		["Trespassing", [4],  "", -5, [["expression", format[_EXECscript5,"trespassing.sqf"]]], "1", "1"],
		["Restricted Airspace", [5],  "", -5, [["expression", format[_EXECscript5,"enteringRestricedAirspace.sqf"]]], "1", "1"],
		["Illegal Firearm", [6],  "", -5, [["expression", format[_EXECscript5,"carryingAnIllegalFirearm.sqf"]]], "1", "1"],
		["Illegal Explosives", [7],  "", -5, [["expression", format[_EXECscript5,"useofillegalexplosives.sqf"]]], "1", "1"],	
		["Drug Possession", [8],  "", -5, [["expression", format[_EXECscript5,"drugPossession.sqf"]]], "1", "1"],
		["Drug Trafficking", [9],  "", -5, [["expression", format[_EXECscript5,"drugTrafficking.sqf"]]], "1", "1"],
		["Intent To Distribute", [10],  "", -5, [["expression", format[_EXECscript5,"intentToDistribute.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu2 = 
[
	["Wanted Menu",true],
		["Petty Theft", [2],  "", -5, [["expression", format[_EXECscript5,"pettyTheft.sqf"]]], "1", "1"],
		["Grand Theft", [3],  "", -5, [["expression", format[_EXECscript5,"grandTheft.sqf"]]], "1", "1"],
		["Attempted Auto Theft", [4],  "", -5, [["expression", format[_EXECscript5,"attemptedAutoTheft.sqf"]]], "1", "1"],
		["Robbery", [5],  "", -5, [["expression", format[_EXECscript5,"robbery.sqf"]]], "1", "1"],
		["Hit And Run", [6],  "", -5, [["expression", format[_EXECscript5,"hitAndRun.sqf"]]], "1", "1"],
		["Attempted Rape", [7],  "", -5, [["expression", format[_EXECscript5,"attemptedRape.sqf"]]], "1", "1"],
		["Rape", [8],  "", -5, [["expression", format[_EXECscript5,"rape.sqf"]]], "1", "1"],
		["Manslaughter", [9],  "", -5, [["expression", format[_EXECscript5,"manslaughter.sqf"]]], "1", "1"],
		["Vehicular Manslaughter", [10],  "", -5, [["expression", format[_EXECscript5,"vehicularManslaughter.sqf"]]], "1", "1"],
		["Attempted Murder", [11],  "", -5, [["expression", format[_EXECscript5,"attemptedMurder.sqf"]]], "1", "1"],
		["Next page", [12], "#USER:VehicleMenu3", -5, [["expression", ""]], "1", "1"],
		["Prev page", [13], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [14], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu3 = 
[
	["Wanted Menu",true],
		["Evading Arrest", [2],  "", -5, [["expression", format[_EXECscript5,"evadingarrest.sqf"]]], "1", "1"],
		["Assault", [3],  "", -5, [["expression", format[_EXECscript5,"assault.sqf"]]], "1", "1"],
		["Assault on Police", [4],  "", -5, [["expression", format[_EXECscript5,"assaultonpolice.sqf"]]], "1", "1"],
		["Threatening an Officer", [5],  "", -5, [["expression", format[_EXECscript5,"threateninganofficer.sqf"]]], "1", "1"],
		["Prev page", [6], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [7], "", -3, [["expression", ""]], "1", "1"]
];
//Soldier = //disabled
//[
//	["", true],
//			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
//];
		
showCommandingMenu "#USER:adminmenu";
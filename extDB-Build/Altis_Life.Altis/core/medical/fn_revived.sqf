/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
[] spawn life_fnc_loadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(life_atmcash > (call life_revive_fee)) then {
	life_atmcash = life_atmcash - (call life_revive_fee);
} else {
	life_atmcash = 0;
};

//if the unit is wearing a Rangemaster shirt we might need to re-skin it
if (uniform player == "U_Rangemaster") then {
	switch(playerSide) do {
		case independent: {[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
		case west: {[[player,0,"textures\police_uniform_co.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
	};
};

//SWAT uniform re-skin
if (uniform player == "U_B_CombatUniform_mcam") then {
	switch(playerSide) do {
		case west: {[[player,0,"textures\swat_shirt.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
	};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.
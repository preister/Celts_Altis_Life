#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_animalTypes"];
_curTarget = cursorTarget;
_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
if(life_interrupted) exitWith {life_interrupted = false;};
//we set life action in use as soon as possible.
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) then {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") exitWith {[_fish] call life_fnc_catchFish;};
	} else {
		if(playerSide == civilian) exitWith {[] call life_fnc_gather;};
	};
};


if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!

//Check if it's a dead body - and not a animal. Are we a Medi Or a Cop (configured to revive players) And do we have a Medikit in our inventory?
if(_curTarget isKindOf "Man" && !((typeOf _curTarget) in _animalTypes) && !(alive _curTarget)) exitWith {
	if ((playerSide == independent) || (playerSide == west && __GETC__(life_revive_cops))) then {
		if ("Medikit" in (items player)) then {
			[_curTarget] call life_fnc_revivePlayer;
		} else {
			hint "A Medikit is required to provide EMS.";
		};
	} else {
		hint "You do not have the necessary qualifications to provide EMS.";
	};
};

//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == west) exitWith {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == civilian) exitWith {
		[_curTarget] call life_fnc_civInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog && (player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2)) exitWith {
			[_curTarget] call life_fnc_vInteractionMenu;
		};
	} else {
		//Is it a animal type?
		private ["_handle"];
		_handle = objNull;
		if((typeOf _curTarget) in _animalTypes) then {
			if(((typeOf _curTarget) == "Turtle_F") && !(alive _curTarget)) then {
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
			} else {
				_handle = [_curTarget] spawn life_fnc_catchFish;
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				_handle = [_curTarget] spawn life_fnc_pickupItem; //OK, it was a misc item (food,water,etc).
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
				};
			};
		};
		//lets wait until anything we might have spawned is done
		if !(isNull _handle) then {
			waitUntil{scriptDone _handle};
		};
	};
};
/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
//initialize the data backend
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
master_group attachTo[bank_obj,[0,0,0]];
//load missions - we might want to move this into the life_server at a later date when things are more stable, developing is a lot easier if stuff is in the mission.
[] call life_fnc_initMissions;

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

//Spawn the new hospitals.
{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]]; 
	detach _var;
} foreach ["hospital_2","hospital_3"];

[8,true,true,12] execFSM "core\fsm\timeModule.fsm";
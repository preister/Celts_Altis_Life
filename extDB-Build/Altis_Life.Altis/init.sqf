enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "zlt_fastrope.sqf";

// if you are running as server and client you are a editor.
//if (isServer && hasInterface) then {[] execVM "LxOPS\lxOPS.sqf";}
// this is the bootstrap for the object spawn scripts
if (isServer) then {call compile preprocessFile "mission\initBuildings.sqf";};

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
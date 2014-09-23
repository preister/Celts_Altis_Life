
waituntil {!alive player ; !isnull (finddisplay 46)};
if (playerSide == west) then {

act = player addaction [("<t color=""#0074E8"">" + ("Police Menu") +"</t>"),"scripts\fusionsmenu\admin\tools.sqf","",5,false,true,"",""];

};
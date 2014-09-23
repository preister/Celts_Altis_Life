/*
    File: fn_moonshine.sqf
    Author: Kuchiha
	Modified by Dubbz261
    Description:
    Moonshine effects.
*/

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting moonshine effects
hint "Yamas !";
sleep 3;

//Activate ppEffects we need
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 3 minutes of effetcs
for "_i" from 0 to 180 do
{  
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"radialBlur" ppEffectEnable false;
resetCamShake;
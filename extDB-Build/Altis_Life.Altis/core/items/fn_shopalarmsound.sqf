private["_shop"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _shop) exitWith {};
for "_i" from 0 to 1 step 1 do {_vault say3D "shop_alarm";sleep 91.2;};

//need to store
// _resource : the name of the resource as input
// _zoneSize : the diameter of the resource zone in meters
// _batchSize : how many items should be gathererd in one go
// _requiredItem : is an item required to grather this resource?
private["_resource","_zoneSize", "_batchSize", "_requiredItem","_resourceZones"];
_resource = [_this,0,"",[""]] call BIS_fnc_param;

//default values
_zoneSize = 30;
_batchSize = 1;
_requiredItem = "";
_resourceZones = [];

//if you want to overwrite a value for one of the resource just add a case for it here
switch(_resource) do {

	case ("apple") : {
		_batchSize = 3;
		_resourceZones = ["apple_1","apple_2","apple_3","apple_4"];
	};
	
	case ("peach") : {
		_batchSize = 3;
		_resourceZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
	};
	
	case  ("heroinu") : {
		_resourceZones = ["heroin_1"];
	};
	
	case  ("cocaine") : {
		_resourceZones = ["cocaine_1"];
	};
	
	case  ("cannabis") : {
		_resourceZones = ["weed_1"];
	};
	
	case  ("methu") : {
		_resourceZones = ["meth_1"];
	};
	
	case  ("corn") : {
		_batchSize = 5;
		_resourceZones = ["corn_1"];
	};
	
	case ("copperore") : {
		_batchSize = 3;
		_requiredItem = "pickaxe";
		_resourceZones = ["lead_1"];
	};
	
	case ("ironore") : {
		_batchSize = 2;
		_requiredItem = "pickaxe";
		_resourceZones = ["iron_1"];
	};
	
	case ("salt") : {
		_batchSize = 3;
		_requiredItem = "pickaxe";
		_resourceZones = ["salt_1"];
		_zoneSize = 120;
	};
	
	case ("platinumu") : {
		_batchSize = 1;
		_requiredItem = "pickaxe";
		_resourceZones = ["plat_1"];
		_zoneSize = 65;
	};
	
	case ("diamond") : {
		_requiredItem = "pickaxe";
		_resourceZones = ["diamond_1"];
		_zoneSize = 50;
	};
	
	case ("oilu") : {
		_requiredItem = "pickaxe";
		_resourceZones = ["oil_1"];
		_zoneSize = 40;
	};
	
	case ("rock") : {
		_requiredItem = "pickaxe";
		_resourceZones = ["rock_1"];
		_zoneSize = 50;
	};
};

[_resourceZones, _zoneSize,_batchSize, _requiredItem];
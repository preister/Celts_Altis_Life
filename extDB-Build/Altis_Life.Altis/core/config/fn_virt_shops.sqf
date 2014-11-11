/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","zipties"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple",,"tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","methp"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "jewellers": {["Jewellers",["platinump","diamond","diamondc"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "bar": {["CeltS Bar",["moonshine","turtlesoup"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "jail": {["Jail Shop",["water","apple"]]};
	case "blueking": {["Blue King",["Blueburger","cola"]]};
	case "gyros": {["Gyros",["gyros","cola"]]};
	case "redburger": {["Red Burger",["Redburger","cola"]]};
	case "newsstand": {["News Stand",["twix","kitkat","crisps","cola"]]};
};
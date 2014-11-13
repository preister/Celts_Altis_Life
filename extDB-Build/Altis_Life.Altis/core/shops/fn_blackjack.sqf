/*
	File: fn_blackjack.sqf
	Description: Blackjack
	Created by Blacklistgaming.org
        Coder: PapaBear
*/

if(!dialog) then {
	createDialog "BlackjackGUI";
};
disableSerialization;

_display = findDisplay 5980;
_Hit = _display displayCtrl 5983;
_Stay = _display displayCtrl 5982;

_Hit ctrlEnable false;
_Stay ctrlEnable false;

_bet1 = _display displayCtrl 5984;
_bet2 = _display displayCtrl 5985;
_bet3 = _display displayCtrl 5986;
_bet4 = _display displayCtrl 5987;

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
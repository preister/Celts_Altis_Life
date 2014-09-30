class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			
			x = 0.12; y = 0.26;
			w = 0.2; h = 0.4;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.34;
			y = 0.03;
			w = 0.6;
			h = 0.6;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.5;
			y = 0.76;
			w = 0.15;
			h = 0.04;
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2404;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.3;
			y = 0.76;
			w = 0.15;
			h = 0.04;
		};
		
		//place 2 dropdown menus below the wanted list, first one fore players 2nd for the crime
		//we just use the full player list for now and tell the cop later that you cant arrest a cop or a medic
		class PlayerList : Life_RscCombo 
		{
			idc = 2405;
			x = 0.12; y = 0.68;
			w = 0.2; h = 0.03;
		};
		
		class CrimesList : Life_RscCombo
		{
			idc = 2406;
			x = 0.12; y = 0.72;
			w = 0.2; h = 0.03;
		};
		
		class ChargeButtonKey : Life_RscButtonMenu {
			idc = 2407;
			text = "Charge Crime";
			onButtonClick = "[] call life_fnc_charge;";
			x = 0.1;
			y = 0.76;
			w = 0.15;
			h = 0.04;
		};
	};
};
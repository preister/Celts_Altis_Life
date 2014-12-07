/*
	File: slot_machine.hpp
        Author: Jacob "PapaBear" Tyler
	Description: Gui for slotmachine
*/

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

class SlotMachineGUI
{
	idd = 5780;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	
		class RscFrame_1800: life_RscText
		{
			idc = 5770;
			colorBackground[] = {0,0,0,0.7};
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
		
		class RscText_1000: life_RscText
		{
			idc = 5774;
			text = "Winnings: $"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class RscText_1003: life_RscText
		{
			idc = 5783;
			text = "BET"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1004: life_RscText
		{
			idc = 5784;
			text = "BET"; //--- ToDo: Localize;
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1005: life_RscText
		{
			idc = 5786;
			text = "BET"; //--- ToDo: Localize;
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1006: life_RscText
		{
			idc = 5787;
			text = "BET"; //--- ToDo: Localize;
			x = 32 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class RscText_1002: life_RscText
		{
			idc = 5776;
			text = "SLOT MACHINE"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			sizeEx = 4 * GUI_GRID_H;
		};
		
	};
	
	class controls
	{
	
		class SLOT_1: life_RscPicture
		{
			idc = 5771;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_2: life_RscPicture
		{
			idc = 5772;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_3: life_RscPicture
		{
			idc = 5773;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		
		class Winnings: life_RscText
		{
			idc = 5775;
			test = "";
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class EXIT_BTN: life_RscButtonMenu
		{
			idc = -1;
			text = "EXIT"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class BET_5K: life_RscButtonMenu
		{
			idc = 5778;
			text = "5K"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[5000] spawn life_fnc_slotSpin;";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_50K: life_RscButtonMenu
		{
			idc = 5779;
			text = "50K"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[50000] spawn life_fnc_slotSpin;";
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_25K: life_RscButtonMenu
		{
			idc = 5781;
			text = "25K"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[25000] spawn life_fnc_slotSpin;";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_10K: life_RscButtonMenu
		{
			idc = 5782;
			text = "10K"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[10000] spawn life_fnc_slotSpin;";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
	};
};
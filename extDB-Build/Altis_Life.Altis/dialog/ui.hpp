	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 3.4028235e38; //The largest real positive number that can be entered via script: https://community.bistudio.com/wiki/Number
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class foodHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\food.paa";
				x = safeZoneX+safeZoneW-0.115; y = safeZoneY+safeZoneH-0.54;
				w = 0.03; h = 0.04;
			};
			
			class waterHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\water.paa";
				x = safeZoneX+safeZoneW-0.12; y = safeZoneY+safeZoneH-0.50;
				w = 0.04; h = 0.04;
			};
			
			class healthHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\health.paa";
				x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.445;
				w = 0.02; h = 0.03;
			};
		};
		
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
		};   
 	};
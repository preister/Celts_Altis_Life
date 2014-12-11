#define ST_RIGHT 0x01

class infoBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['infoBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['infoBar', objNull]";
	onDestroy = "uiNamespace setVariable ['infoBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 1;
			y = safezoneY + safezoneH - 0.2;
			w = 1;
			h = 0.2;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="Loading server info...";
			class Attributes {
				align="right";
				color = "#FFFFFF";
			};
		};
	};
};
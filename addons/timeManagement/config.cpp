/*
	By Ghostrider [GRG]
	Copyright 2022
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

class CfgPatches {
	class timeManagement {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgTimeManagement {
	version = "1.00";
	build = "1";
	buildDate = "06-20-2022";
};
class CfgFunctions {
	class TM {
		class functions {
			file = "timeManagement\code";
			class init {
				postInit = 1;
			};
			class time {};
		};
	};
};

class CfgTime {
	useStartTime = 0;   // When set to 1, the server will try to skip to startTime.
	startTime = 8;  	// The server will be forced to skip from the current daytime to this time upon startup.
	daytimeAccel = 6; 	// The time acceleration applied during daytime.
	nighttimeAccel = 6; // The time acceleration applied during night.
	eveningaccel = 6;	// The time acceleration applied during dawn / dusk.
};

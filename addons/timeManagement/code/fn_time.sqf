/*
	GMS_fnc_time.sqf
	by Ghostrider-GRG-

	Credits to AWOL, A3W, LouD and Creampie for insights.
*/

/*
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

private _arr = date call BIS_fnc_sunriseSunsetTime;
_arr params ["_sunrise","_sunset"];
private _time = dayTime;
diag_log format["TM_fnc_time: server time %1 | server daytime %2",diag_tickTime,daytime];
// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {
	private _timeAccelerationNight = getNumber(configfile >> "CfgTime" >> "nighttimeAccel");
	setTimeMultiplier blck_timeAccelerationNight; 
};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {
	private _timeAccelerationDay = getNumber(configfile >> "CfgTime" >> "daytimeAccel");
	setTimeMultiplier blck_timeAccelerationDay; 	
};

// default

private _timeAccelerationDusk = getNumber(configfile >> "CfgTime" >> "eveningaccel");
setTimeMultiplier blck_timeAccelerationDusk; 




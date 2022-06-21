

private ["_arr","_sunrise","_sunset","_time"];
_arr = date call BIS_fnc_sunriseSunsetTime;
_arr params["_sunrise","_sunset"];
_time = dayTime;
diag_log format["TM_fnc_time: server time %1 | server daytime %2",diag_tickTime,daytime];
// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {
	private _accelNight =  = getNumber(configFile >> "CfgTimeManagement" >> "nighttimeAccel");
	setTimeMultiplier _accelDay; 
};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {
	private _accelDay =  = getNumber(configFile >> "CfgTimeManagement" >> "daytimeAccel");
	setTimeMultiplier _accelDay; 	
};

// default
private _accelTwilight =  = getNumber(configFile >> "CfgTimeManagement" >> "twilightAccel");
setTimeMultiplier _accelTwilight; 




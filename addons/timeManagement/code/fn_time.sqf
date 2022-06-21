

private ["_arr","_sunrise","_sunset","_time"];
_arr = date call BIS_fnc_sunriseSunsetTime;
_arr params["_sunrise","_sunset"];
_time = dayTime;
diag_log format["[TimeManagement] server time %1 | server daytime %2",diag_tickTime,_time];

// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {
	private _accelNight = getNumber(configFile >> "CfgTimeManagement" >> "nighttimeAccel");
	diag_log format["[TimeManagement] time multiplier will be set to _accelNight = %1",_accelNight];
	setTimeMultiplier _accelDay; 
};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {
	private _accelDay = getNumber(configFile >> "CfgTimeManagement" >> "daytimeAccel");
	diag_log format["[TimeManagement] time multiplier will be set to  _accelDay = %1",_accelDay];
	setTimeMultiplier _accelDay; 	
};

// default
private _accelTwilight = getNumber(configFile >> "CfgTimeManagement" >> "twilightAccel");
diag_log format["[TimeManagement] time multiplier will be set to  _accelTwilight = %1",_accelTwilight];
setTimeMultiplier _accelTwilight; 




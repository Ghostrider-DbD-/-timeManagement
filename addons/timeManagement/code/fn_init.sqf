/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
if !(isNil "TM_timeAcceleration_Loaded") exitWith {diag_log format["GMS_Apps already loaded",diag_tickTime];};
GRG_timeAcceleration_Loaded = true;
private _build = getText(configFile >> "CfgTimeBuild" >> "build");
private _ver = getText(configFile >> "CfgTimeBuild" >> "version");
private _date = getText(configFile >> "CfgTimeBuild" >> "buildDate");
// CfgTimeSettings

private _useStartTime = getNumber(configfile >> "CfgTimeManagement" >> "useStartTime");
// startTime
if (_useStartTime == 1) then 
{
	private _startTime = getNumber(configfile >> "CfgTimeManagement" >> "startTime");
	skipTime ((_startTime - dayTime + 24) % 24); // Skip forward to the starttime.	
};

diag_log format["[TimeManagement] Loaded Version %1 | Build %2 | Dated %3",_ver,_build,_date];
private _timeLoop = {
	uiSleep 60;
	[] call TM_fnc_time;
};
[] spawn _timeLoop;
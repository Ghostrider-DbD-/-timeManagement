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
private _build = getText(configFile >> "CfgTimeManagement" >> "build");
private _ver = getText(configFile >> "CfgTimeManagement" >> "version");
private _date = getText(configFile >> "CfgTimeManagement" >> "buildDate");
// CfgTimeSettings

private _useStartTime = getNumber(configfile >> "CfgTime" >> "useStartTime");
// startTime
if (_useStartTime == 1) then 
{
	private _startTime = getNumber(configfile >> "CfgTime" >> "startTime");
	skipTime ((_startTime - dayTime + 24) % 24); // Skip forward to the starttime.	
};

diag_log format["GRG_TimeManagement %1 Build %2 Dated %3 Loaded",_ver,_build,_date];
private _timeLoop = {
	uiSleep 60;
	[] call TM_fnc_time;
};
[] spawn _timeLoop;
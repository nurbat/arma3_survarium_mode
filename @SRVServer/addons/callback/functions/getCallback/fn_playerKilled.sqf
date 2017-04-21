params ["_killed", "_killer"];
if(DebugLevel > 1) then { diag_log format["[SRVS-Callback -> Get => PlayerKilled] %1", name _killed]; };

//Run CallBack functions
{
   if(DebugLevel > 2) then { diag_log format["[SRVS-Callback -> Module => PlayerKilled] %1", _x]; };
   [_this, _x] Call BIS_fnc_call;
} forEach PlayerKilledCallback;
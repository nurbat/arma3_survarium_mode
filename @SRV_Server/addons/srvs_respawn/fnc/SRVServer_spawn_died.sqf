params ["_unit", "_killer"];
if(isPlayer _unit && (_unit getVariable["loadedIn", false])) then {
    (getPlayerUID _unit) Call SRVServer_core_player_delete;
	_unit setVariable ["loadedIn", false, true];//STATUS IS LOADED
	diag_log format["[SRVS-RESPAWN] DIED %1",_unit getVariable["loadedIn", false]]; 
};
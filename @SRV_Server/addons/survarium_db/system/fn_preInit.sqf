diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
private  _result = "extDB3" callExtension "9:VERSION";
if (_result == "") then
{
  diag_log "extDB3 Failed to Load, Check Requirements @ https://bitbucket.org/torndeco/extdb3/wiki/Installation";
  diag_log "";
  diag_log "If you are running this on a client, Battleye will random block extensions. Try Disable Battleye";
  extDB3_var_loaded = false;
} else {
  diag_log "extDB3 Loaded";
  extDB3_var_loaded = true;
};
["Database", "SQL_CUSTOM", "mysql.ini"] execVM "survarium_db\functions\survarium_db_init.sqf";
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
	
    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['survarium_db_loaded', 'survarium_db\functions\survarium_db_loaded.sqf'],
	['survarium_db_async', 'survarium_db\functions\survarium_db_async.sqf'],
	['survarium_db_query', 'survarium_db\functions\survarium_db_query.sqf']
];
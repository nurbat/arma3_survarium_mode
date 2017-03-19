_data = _this select 0;
_owner = _this select 1;

[_data, { 
    removeAllWeapons player;
    removeAllAssignedItems player;
    removeGoggles player;
    removeHeadgear player;
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeAllItems player;
    removeAllContainers player;
        
    player setDamage (_this select 2);
    player setPosASL [(_this select 4),(_this select 5),(_this select 6)];
    player setDir (_this select 3);
    player disableAI "ALL";

    //hitPoints
    _hitPoints = _this select 7;
    {
        player setHitPointDamage [_x select 0, _x select 1];
    } forEach _hitPoints;

    //assignedItems
    _assignedItems = _this select 8;
    if !(_assignedItems isEqualTo []) then
    {
        {
            player linkItem _x;
        }
        forEach _assignedItems;
    };

    //goggles
    _goggles = _data select 14;
    if (_goggles != "") then
    {
        player addGoggles _goggles;
    };

    //handgunWeapon
    _handgunWeapon = _data select 16;
    if (_handgunWeapon != "") then
    {
        player addWeaponGlobal _handgunWeapon;
        removeAllHandgunItems player;
        { 
            if (_x != "") then
            {
                player addHandgunItem _x; 
            };
        } 
        forEach (_data select 15);
    };

    //headgear
    _headgear = _data select 17;
    if (_headgear != "") then
    {
        player addHeadgear _headgear;
    };

    //binocular
    _binocular = _data select 18;
    if (_binocular != "") then
    {
        player addWeaponGlobal _binocular;
    };

    //currentWeapon
    _currentWeapon = _data select 13;
    if (_currentWeapon != "") then
    {
        player selectWeapon _currentWeapon;
    };

    //primaryWeapon
    _primaryWeapon = _data select 20;
    if (_primaryWeapon != "") then 
    {
        player addWeaponGlobal _primaryWeapon;
        removeAllPrimaryWeaponItems player;
        { 
            if (_x != "") then
            {
                player addPrimaryWeaponItem _x; 
            };
        } 
        forEach (_data select 21);
    };


    //secondaryWeapon
    _secondaryWeapon = _data select 22;
    if (_secondaryWeapon != "") then
    {
        player addWeaponGlobal _secondaryWeapon;
        { 
            if (_x != "") then
            {
                player addSecondaryWeaponItem _x; 
            };
        } 
        forEach (_data select 23);
    };

    //loaded_magazines
    { 
        player addWeaponItem [_x select 0, [_x select 1, _x select 2, _x select 3]];
    } forEach (_data select 19);


    //Uniform
    _uniform = _data select 24;
    if (_uniform != "") then 
    {
        player forceAddUniform _uniform;

        _uniformContainer = uniformContainer player;
        if !(isNil "_uniformContainer") then
        {
            { 
                _uniformContainer addWeaponCargoGlobal _x; 
            } 
            forEach (_data select 27);
            { 
                _uniformContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]; 
            } 
            forEach (_data select 26);
            { 
                _uniformContainer addItemCargoGlobal _x; 
            } 
            forEach (_data select 25);
        };
    };

    //Vest
    _vest = _data select 28;
    if (_vest != "") then
    {
        player addVest _vest;

        _vestContainer = vestContainer player;
        if !(isNil "_vestContainer") then
        {
            { 
                _vestContainer addWeaponCargoGlobal _x; 
            } 
            forEach (_data select 31);
            { 
                _vestContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]; 
            } 
            forEach (_data select 30);
            { 
                _vestContainer addItemCargoGlobal _x; 
            } 
            forEach (_data select 29);
        };
    };

    //backpack
    _backpack = _data select 9;
    if (_backpack != "") then
    {
        player addBackpackGlobal _backpack;

        _backpackContainer = backpackContainer player;
        if !(isNil "_backpackContainer") then
        {
            { 
                _backpackContainer addWeaponCargoGlobal _x; 
            } 
            forEach (_data select 12);
            { 
                _backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]; 
            } 
            forEach (_data select 11);
            { 
                _backpackContainer addItemCargoGlobal _x; 
            } 
            forEach (_data select 10);
        };
    };

	player setVariable ["loadedIn", true, true];//STATUS IS LOADED
}, _owner] Call SRVServer_core_exec;
	params ["_player"];
    {
		_cargoType = _x call SRVServer_util_itemType;
		switch (_cargoType) do
		{
			case "Mine": 		{ _player addItem _x; };
			case "Weapon": 		{ _player addWeaponGlobal _x; };
			case "Backpack": 	{ _player addBackpackGlobal _x; };
			case "Uniform": 	{ _player forceAddUniform _x; };
			case "Vest": 		{ _player addVest _x; };
			case "Item":		{ _player linkItem _x; };
			default 			{ _player addItem _x; };
		};
	} forEach loadOut;
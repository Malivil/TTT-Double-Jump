Thanks to [Willox](https://steamcommunity.com/id/willox) for the '[Double Jump!](https://steamcommunity.com/sharedfiles/filedetails/?id=284538302)' mod which was the foundation of this mod.\
Thanks to [GengarDC](https://steamcommunity.com/id/GengarDC) for the '[TTT_Double_Jump_Nerfed](https://steamcommunity.com/sharedfiles/filedetails/?id=1962801891)' mod which inspired some of the changes in this mod.\
\
**Edits and replaces the original version to add settings and remove the TF2 requirement**

# Changes from the Original Version
- Replaced the jumping particle effect to remove the Team-Fortress 2 requirement
- Added a setting to disallow multi-jumping if you've fallen too far
- Added a setting to disallow multi-jumping if you didn't jump originally (e.g. were batted or fell), thanks to GengarDC!
- Added a setting to disallow multi-jumping if you've just vaulted or wall-ran (with a compatible addon)
- Added calling of `OnPlayerJump` for each multi-jump

# Configurations
```cpp
multijump_default_jumps           1 // The amount of extra jumps players should get
multijump_default_power           1 // Multiplier for the jump-power when multi jumping
multijump_max_fall_distance       0 // The maximum distance a player can fall before multi jump is disabled
multijump_can_jump_while_falling  1 // Whether the player should be able to multi-jump if they didn't jump to begin with
multijump_can_jump_after_vaulting 1 // Whether the player should be able to multi-jump after they finish vaulting or wallrunning. Explicitly compatible with VManip Vaulting (https://steamcommunity.com/sharedfiles/filedetails/?id=2364206712) and Mantle + Wallrun (https://steamcommunity.com/sharedfiles/filedetails/?id=2027577882)
```

# Hooks
## OnPlayerJump(ply, speed, multi)
Modified to add a third parameter that will be `true` if the hook is called from a multi-jump

# Special Thanks
- [Willox](https://steamcommunity.com/id/willox) for the ['Double Jump!'](https://steamcommunity.com/sharedfiles/filedetails/?id=284538302) mod.
- [GengarDC](https://steamcommunity.com/id/GengarDC) for his [TTT_Double_Jump_Nerfed](https://steamcommunity.com/sharedfiles/filedetails/?id=1962801891) mod whose functionality was integrated via a setting.

# Workshop
Click [here](https://steamcommunity.com/sharedfiles/filedetails/?id=2501234496) to view the workshop page in your browser or copy/paste this to open it in Steam: steam://openurl/steamcommunity.com/sharedfiles/filedetails/?id=2501234496

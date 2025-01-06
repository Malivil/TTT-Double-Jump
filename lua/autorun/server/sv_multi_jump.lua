local default_jumps = CreateConVar("multijump_default_jumps", "1", FCVAR_ARCHIVE, "The amount of extra jumps players should get")
local default_power = CreateConVar("multijump_default_power", "1", FCVAR_ARCHIVE, "Multiplier for the jump-power when multi jumping")
local max_fall_distance = CreateConVar("multijump_max_fall_distance", "0", FCVAR_ARCHIVE, "The maximum distance a player can fall before multi jump is disabled")
local can_jump_while_falling = CreateConVar("multijump_can_jump_while_falling", "1", FCVAR_ARCHIVE, "Whether the player should be able to multi-jump if they didn't jump to begin with", 0, 1)
local can_jump_after_vaulting = CreateConVar("multijump_can_jump_after_vaulting", "1", FCVAR_ARCHIVE, "Whether the player should be able to multi-jump after they finish vaulting", 0, 1)

hook.Add("OnEntityCreated", "MultiJumpOnEntityCreated", function(ply)
    if ply:IsPlayer() then
        ply:SetJumpLevel(0)
        if can_jump_while_falling:GetBool() then
            ply:SetJumped(-1)
        else
            ply:SetJumped(0)
        end
        ply:SetMaxJumpLevel(default_jumps:GetInt())
        ply:SetExtraJumpPower(default_power:GetInt())
        ply:SetMaxJumpDistance(max_fall_distance:GetInt())
        ply:SetJumpLocation(vector_origin)
    end
end)

cvars.AddChangeCallback("multijump_default_jumps", function(_, _, new)
    new = tonumber(new)
    for _, v in pairs(player.GetAll()) do
        v:SetMaxJumpLevel(new)
    end
end)

cvars.AddChangeCallback("multijump_default_power", function(_, _, new)
    new = tonumber(new)
    for _, v in pairs(player.GetAll()) do
        v:SetExtraJumpPower(new)
    end
end)

cvars.AddChangeCallback("multijump_max_fall_distance", function(_, _, new)
    new = tonumber(new)
    for _, v in pairs(player.GetAll()) do
        v:SetMaxJumpDistance(new)
    end
end)

cvars.AddChangeCallback("multijump_can_jump_while_falling", function(_, _, new)
    new = tonumber(new)
    for _, v in pairs(player.GetAll()) do
        if new == 1 then
            v:SetJumped(-1)
        else
            v:SetJumped(0)
        end
    end
end)

hook.Add("Initialize", "MultiJumpPostInitialize", function()
    local plymeta = FindMetaTable("Player")

    -- Integrate with [VManip] Vaulting - https://steamcommunity.com/sharedfiles/filedetails/?id=2364206712
    -- Reset the jump level when a player finishes vaulting to allow players to jump after a vault
    if plymeta.SetMantle then
        local oldSetMantle = plymeta.SetMantle
        function plymeta:SetMantle(mantle)
            oldSetMantle(self, mantle)
            if can_jump_after_vaulting:GetBool() and mantle == 0 then
                -- Delay this slightly so we don't auto-jump immediately after the vault finishes
                timer.Simple(0.25, function()
                    if IsValid(self) then
                        self:ResetJumpState()
                    end
                end)
            end
        end
    end
end)

-- Integrate with Mantle + Wallrun - https://steamcommunity.com/sharedfiles/filedetails/?id=2027577882
-- Reset the jump level when a player mantles or wallruns
hook.Add("PlayerPostThink", "MultiJumpPlayerPostThink", function(ply)
    if not can_jump_after_vaulting:GetBool() then return end

    if ply.InMantle then
        -- Delay this slightly so we don't auto-jump immediately after the mantle finishes
        timer.Simple(0.25, function()
            if IsValid(ply) and ply.InMantle then
                ply:ResetJumpState()
            end
        end)
    end

    if ply.InVWallrun or ply.InHWallrun then
        ply:ResetJumpState()
    end
end)
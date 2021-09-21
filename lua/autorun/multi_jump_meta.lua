local plymeta = FindMetaTable("Player")

function plymeta:GetJumpLevel()
    return self:GetNWInt("MJ_JumpLevel")
end

function plymeta:SetJumpLevel(level)
    self:SetNWInt("MJ_JumpLevel", level)
end

function plymeta:GetMaxJumpLevel()
    return self:GetNWInt("MJ_MaxJumpLevel")
end

function plymeta:SetMaxJumpLevel(level)
    self:SetNWInt("MJ_MaxJumpLevel", level)
end

function plymeta:GetExtraJumpPower()
    return self:GetNWFloat("MJ_ExtraJumpPower")
end

function plymeta:SetExtraJumpPower(power)
    self:SetNWFloat("MJ_ExtraJumpPower", power)
end

function plymeta:GetJumped()
    return self:GetNWInt("MJ_Jumped")
end

function plymeta:SetJumped(jumped)
    self:SetNWInt("MJ_Jumped", jumped)
end

function plymeta:GetMaxJumpDistance()
    return self:GetNWInt("MJ_MaxJumpDistance")
end

function plymeta:SetMaxJumpDistance(max_distance)
    self:SetNWInt("MJ_MaxJumpDistance", max_distance)
end

function plymeta:GetJumpLocation()
    return self:GetNWVector("MJ_JumpLocation")
end

function plymeta:SetJumpLocation(loc)
    self:SetNWVector("MJ_JumpLocation", loc)
end
local plymeta = FindMetaTable("Player")

function plymeta:GetJumpLevel()
    return self:GetDTInt(23)
end

function plymeta:SetJumpLevel(level)
    self:SetDTInt(23, level)
end

function plymeta:GetMaxJumpLevel()
    return self:GetDTInt(24)
end

function plymeta:SetMaxJumpLevel(level)
    self:SetDTInt(24, level)
end

function plymeta:GetExtraJumpPower()
    return self:GetDTFloat(25)
end

function plymeta:SetExtraJumpPower(power)
    self:SetDTFloat(25, power)
end

function plymeta:GetJumped()
    return self:GetDTInt(26)
end

function plymeta:SetJumped(jumped)
    self:SetDTInt(26, jumped)
end

function plymeta:GetMaxJumpDistance()
    return self:GetDTInt(27)
end

function plymeta:SetMaxJumpDistance(max_distance)
    self:SetDTInt(27, max_distance)
end

function plymeta:GetJumpLocation()
    return self:GetDTVector(28)
end

function plymeta:SetJumpLocation(loc)
    self:SetDTVector(28, loc)
end
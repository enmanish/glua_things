-- Скрипт позволяет уменьшить скорость передвижения влево, вправо и назад.
-- Написан не мною, но вещь довольно полезная.

-- The script allows you to reduce the speed of movement to the left, right and back.
-- It wasn't written by me, but it's quite useful.


hook.Add("SetupMove", "SprintLimit", function(pl, mv, cmd)
	if pl:GetMoveType() ~= MOVETYPE_WALK then return end

	local speed = mv:GetForwardSpeed() ~= 0 and mv:GetSideSpeed() ~= 0 and math.sqrt(pl:GetMaxSpeed() ^ 2 / 2) or pl:GetMaxSpeed()
	local walkspeed = mv:GetForwardSpeed() ~= 0 and mv:GetSideSpeed() ~= 0 and math.sqrt(pl:GetWalkSpeed() ^ 2 / 2) or pl:GetWalkSpeed()
	local slowspeed = walkspeed * 0.8

	if mv:GetForwardSpeed() ~= 0 then
		if mv:GetForwardSpeed() > 0 then
			mv:SetForwardSpeed(speed)
		else
			mv:SetForwardSpeed(-slowspeed)
		end
	end
	
	if mv:GetSideSpeed() ~= 0 then
		mv:SetSideSpeed(mv:GetSideSpeed() / math.abs(mv:GetSideSpeed()) * slowspeed)
	end
end)

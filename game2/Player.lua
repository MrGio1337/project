Player = Class{}

function Player:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 10
	self.height = 10
	
	--self.dy = 0
end


--function Player:update(dt)
--	self.y = self.y + self.dy * dt * SPEED
--end

function Player:collides(target)
	if self.x > target.x + target.width or target.x > self.x + self.width then
		return false
	end
	
	if self.y > target.y + target.height or target.y > self.y + self.height then
		return false
	end
	
	return true
end

function Player:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

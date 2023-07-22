Ball = Class{}

function Ball:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 10
	self.height = 10
	
	self.dx = 1
	self.dy = 0
end

function Ball:update(dt)
	self.x = self.x + self.dx * (SPEED * dt)
	self.y = self.y + self.dy * (SPEED * dt)
end

function Ball:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

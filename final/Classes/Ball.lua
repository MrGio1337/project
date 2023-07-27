Ball = class {}

function Ball:init(x, y, radius)
    self.x = x
    self.y = y
    self.radius = radius

    self.dy = 0
    self.dx = 0
end

function Ball:render()
    love.graphics.circle('fill', self.x, self.y, self.radius)
end
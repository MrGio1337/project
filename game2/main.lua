Class = require 'class'
push = require 'push'

require 'Player'
require 'Ball'

WINDOW_WIDTH = 1366
WINDOW_HEIGHT = 768

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

SPEED = 100

function love.load()

	bigFont = love.graphics.newFont('font.ttf', 64)
	smallFont = love.graphics.newFont('font.ttf', 8)
	
	love.graphics.setDefaultFilter('nearest', 'nearest')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	
	
	player = Player(20, 0)
	ball = Ball(50, 50)
	
	
end

function love.update(dt)

	handlePlayer(dt)
	-- 
	handleBall(dt)
	
	ball:update(dt)
end

function handleBall(dt)
	if ball.x + ball.width > VIRTUAL_WIDTH then
		ball.dx = -ball.dx
	end

	if ball.x < 0 then
		ball.dx = -ball.dx
	end

	if ball.y >= 0 then
		ball.dy = -ball.dy
	end
	
	if ball.y < VIRTUAL_HEIGHT - ball.height then
		ball.dy = -ball.dy
	end
	
	ball:update(dt)
end

function handlePlayer(dt)
	if love.keyboard.isDown('w') and player.y > 0 then
		player.y = player.y - (SPEED * dt)
	end
	if love.keyboard.isDown('s') and player.y < VIRTUAL_HEIGHT - player.height then
		player.y = player.y + (SPEED * dt)
	end

	if player:collides(ball) then
		ball.dx = -ball.dx
		ball.dy = 1
	end
	
end

function love.draw()
	push:start()
	
	love.graphics.setFont(smallFont)
	love.graphics.clear(193/255, 131/255, 131/255, 255/255)
	
	love.graphics.setColor(0/255, 0/255, 0/255, 1)
	
	player:render()
	ball:render()
	
	love.graphics.printf(ball.dx.." | "..ball.dy, 0, 10, VIRTUAL_WIDTH, 'center')
	
	push:finish()
end

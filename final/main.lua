-- library --
class = require "Library.class"
push = require "push"
-- Classes --
require "Classes.Player"
require "Classes.Ball"

-- Window Resolution --
WINDOW_WIDTH = 1366
WINDOW_HEIGHT = 768

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

currentScene = "MENU"

function love.load()
    -- Configuration Of Font
    bigFont = love.graphics.newFont("Fonts/font.ttf", 18)
	smallFont = love.graphics.newFont("Fonts/font.ttf", 8)

    playerScore = 0
    highScore = 0
    speed = 100
    pSpeed = 300

    -- Sounds
    sounds = {
        ['hit'] = love.audio.newSource('Sounds/hit.wav', 'static'),
        ['lose'] = love.audio.newSource('Sounds/lose.mp3', 'static'),
        ['score'] = love.audio.newSource('Sounds/score.mp3', 'static')
    }
    -- Windows Resolution thing idk...
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})


    Player:init(5, VIRTUAL_HEIGHT - 10 * 2, 50, 10)
    Ball:init(50, 50, 5)
    Ball.dx = 1
    Ball.dy = 1

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if currentScene == "MENU" and key == 'space' then
        currentScene = "GAME"
        playerScore = 0
    end
    if currentScene == "GAMEOVER" and key == 'r' then
        currentScene = "GAME"
        playerScore = 0
    end
    if currentScene == "GAMEOVER" and key == 'return' then
        currentScene = "MENU"
    end

end

function love.update(dt)
    if currentScene == "GAME" then
        handlePlayerMovement(dt)
        handleBallMovement(dt)
    end
end

function handleBallMovement(dt)

    if Ball.y >= Player.y - Ball.radius and Ball.y <= (Player.y + Player.height) - Ball.radius and Ball.x >= Player.x and Ball.x <= Player.x + Player.width then
        Ball.dy = -Ball.dy
        playerScore = playerScore + 1
        speed = speed + 5
        sounds['score']:play()
    end

    if Ball.y <= Ball.radius then
        Ball.dy = -Ball.dy
        sounds['hit']:play()
    end

    if Ball.y >= VIRTUAL_HEIGHT - Ball.radius then
        speed = 100
        currentScene = "GAMEOVER"
        sounds['lose']:play()
    end

    if Ball.x >= VIRTUAL_WIDTH - Ball.radius then
        Ball.dx = -Ball.dx
        sounds['hit']:play()
    end

    if Ball.x <= 0 + Ball.radius then
        Ball.dx = -Ball.dx
        sounds['hit']:play()
    end

    Ball.x = Ball.x + Ball.dx * speed * dt
    Ball.y = Ball.y + Ball.dy * speed * dt

end

function handlePlayerMovement(dt)
    if (love.keyboard.isDown('a') or love.keyboard.isDown("left")) and Player.x >= 0 then
        Player.x = Player.x - pSpeed * dt
    end
    if (love.keyboard.isDown('d') or love.keyboard.isDown("right")) and Player.x <= VIRTUAL_WIDTH - Player.width then
        Player.x = Player.x + pSpeed * dt
    end
 
end

function love.draw()
    push:start()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    if currentScene == "MENU" then
        love.graphics.setFont(smallFont)
		love.graphics.printf(
			'This is a menu press "space" to start\nHighscore: '..highScore,
			0,
			20,
			VIRTUAL_WIDTH,
			'center')
    end
    if currentScene == "GAME" then
        love.graphics.setFont(smallFont)

        love.graphics.printf("Score: ".. playerScore, 0, 40, VIRTUAL_WIDTH, 'center')
        Player:render()
        Ball:render()
    end
    if currentScene == "GAMEOVER" then
        love.graphics.setFont(bigFont)
        love.graphics.printf(
            'You have lost the game, with score of '.. playerScore.."\n Press R to restart or ENTER to give up",
            0,
            50,
            VIRTUAL_WIDTH,
            'center'
        )
        Ball.x = 50
        Ball.y = 50
        if highScore < playerScore then
            highScore = playerScore
        end
    end
    
    push:finish()
end
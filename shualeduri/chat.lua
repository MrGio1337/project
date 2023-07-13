-- [ Rock, Paper, Scissors ] --
-- Made by Giorgi Gogiberidze
-- 1 - Rock
-- 2 - Paper
-- 3 - Scissors
-- Enjoy!

--- [ Random Seed ] ---
math.randomseed(os.time())
--------------------------

--- [ Funqciebi ] ---

-- Dalodeba --
-- Ai Magalitad Rodesac Ginda Rom Sistema Cotaxnit Gacherdes Da Shemdeg Isev Gaagrdzelos Mushaoba
-- Swored Es Funqcia Aketebs Amas.
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end


-- Random Saxelebi --
function getRandomNames()
    names = {
        "Shako",
        "Nika",
        "Otiko",
        "Lasha",
        "Giorgi",
        "Nini",
        "Lika",
        "Mari",
        "Tamta",
        "Temuri"
    }
    getName = math.random(1, #names)

    return names[getName]
end

-- Ra Daweros Botma Tu Moigo.
function winMessage()
    local message = {
        "Haha! Witness the power of my rock, paper, scissors mastery! Victory is mine!",
        "Oh yeah! I've got the winning strategy down pat. Bow down to the reigning champion!",
        "In your face! I've got the moves, the luck, and the skills to claim victory in this epic battle!",
        "Woo-hoo! Did you see that? I just outsmarted you with my cunning paper strategy.\nVictory tastes sweet!",
        "I've emerged triumphant! My scissor-wielding finesse was too sharp for you to handle.\nBetter luck next time!"
    }
    local getMessage = math.random(#message)
    return message[getMessage]
end

-- Ra Daweros Botma Tu Waago
function loseMessage()
    local message = {
        "Oops, you got me this round! But don't get too comfortable, I'm just warming up.\nPrepare for my epic comeback!",
        "Alright, you got the better of me for now. But mark my words,\nI'll come back swinging and claim victory!",
        "Hats off to you, my friend! You outplayed me in this round, but I'm not giving up.\nGet ready for my unstoppable return!",
        "Well, well, well... you caught me off guard this time. But don't celebrate too soon.\nI'll regroup and bring my A-game next round!",
        "Impressive! You got me on this one. But remember, it's not over until it's over.\nI'll rise from this setback and turn the tables!",
    }
    local getMessage = math.random(#message)
    return message[getMessage]
end

-- Pirvelad Rom Xvdeba Boti Motamashes.
function getMessages()
    local joinMessage = {
        "Prepare yourself, mere mortal! I've played so much rock, paper, scissors that I can predict your every move.\nResistance is futile!",
        "Ah, another challenger enters the arena! Brace yourself for the crushing defeat that awaits you.\nJust kidding, let's have some fun!",
        "Welcome to the realm of rock, paper, scissors! I've been known to make opponents laugh so hard they lose their focus.\nGet ready for some hilarious battles!",
        "They say 'practice makes perfect,' but in my case, it made me an unbeatable rock, paper, scissors champion.\nYou might want to reconsider challenging me!",
        "Once, I won against the teacher 100 times. After that, she left the school."
    }

    local getMessage = math.random(1, #joinMessage)

    return joinMessage[getMessage]
end

-- Ubralod printshi 10-it Qvemot Chamodis :D
function clearPrint()
    for i = 1, 10 do
        print("")
    end
end

-- Patara Animaciasavit Rom Dzaan Mosawyeni Ar iyos.
function processGame()
    clearPrint()
    print("Rock...")
    wait(1)
    print("Paper...")
    wait(1)
    print("Scissors...\n")
    wait(1)
end

-- Es Funqcia Gadawyvets Tu Vin Moigo Tamashi
function determineGame()
    if bPick == pPick then
        print("Nobody won its tie!")
        print("")

    elseif bPick == 1 and pPick == 3 or bPick == 2 and pPick == 1 or bPick == 3 and pPick == 2 then
        print("Opponent won this round.\n")
        enemyScore = enemyScore + 1
        print(userName.. " : "..winMessage().."\n")
    else
        print("Congratulation! you won this round\n")
        playerScore = playerScore + 1
        print(userName.. " : "..loseMessage().."\n")
    end

end

-- Vitom Internetshi Xar Ubralo Iluziaaa :D
function connectToLobby()
    playerScore = 0
    maxMatch = 3
    enemyScore = 0
    round = 1
    welcomeTextDisplayed = false

    rageQuit = math.random(2)
    connectionDelay = math.random(1, 4)

    userName = getRandomNames()

    print("Looking for someone online please wait...")
    wait(connectionDelay)
    print("We found someone connecting...")
    wait(math.random(1, 2))
    print("now you playing against ".. userName)
    wait(1)

    gameBegin()
end

-- io.read gvadzlevs strings amitomac es stringi gadamyavs ricxvebshi
-- ricxvebis garda araferi ar dawerot gtxovt :D
function handleNumber()
    local input = io.read()
    local number = tonumber(input)
    return number
end

-- Chveni Mtavari Funqcia Saidanac Tamashi Iwyeba :D
function gameBegin()
    for number = 1, maxMatch do
        round = round + 1
        if welcomeTextDisplayed == false then
            print(userName.." : "..getMessages())
        end
        welcomeTextDisplayed = true
        wait(3)
        bPick = math.random(1, 3)
        print(bPick)
        print(userName.. " picked a move. its your turn!\n")
        print("1 - Rock\n2 - Paper\n3 - Scissors")
        pPick = handleNumber()
        processGame()
        determineGame()

        checkGameStatus()
    end
end

-- Tamashis Bolos Vin Moigo Neta? :D
function checkGameStatus()
    if round > maxMatch and playerScore > enemyScore then
        print("You won against "..userName.. " do you wish to continue?\n1 - Yes\n2 - No")
        makeChoice()
    elseif round > maxMatch and playerScore < enemyScore then
        print("You lost against "..userName.." do you wish to continue?\n1 - Yes\n2 - No")
        makeChoice()
    elseif round > maxMatch and playerScore == enemyScore then
        print("Nobody won this game it was tie do you wish to continue?\n1 - Yes\n2 - No")
        makeChoice()
    end
end

-- Surs Motamashes Tamashis Gagrdzeleba Tu Ara :D
function makeChoice()
    choice = handleNumber()
        if choice == 1 then
            connectToLobby()
        else
            os.exit(0)
        end
end

-- Start Game.
connectToLobby()
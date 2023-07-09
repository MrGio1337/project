math.randomseed(os.time())

function checkNum(num)
    return num > 7
end

number = math.random(1, 20)

print(checkNum(number))

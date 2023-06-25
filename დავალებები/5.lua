math.randomseed(os.time())

evenNum = {}
oddNum = {}

evenSum = 0
oddSum = 0

for number = 1, 20 do
    randomNum = math.random(1, 100)
    if randomNum % 2 == 0 then
        table.insert(evenNum, randomNum)
        evenSum = evenSum + randomNum
    else
        table.insert(oddNum, randomNum)
        oddSum = oddSum + randomNum
    end
end

result = evenSum > oddSum and evenSum < 700
print(result)
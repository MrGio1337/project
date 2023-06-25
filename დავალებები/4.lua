math.randomseed(os.time())

numbers = {}

sum = 0

for number = 1, 10 do
    randomNum = math.random(1, 10)
    table.insert(numbers, randomNum)
end

for number = 1, #numbers do
    sum = sum + numbers[number]
end

print(sum % 2 == 0)
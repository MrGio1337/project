function calculateNumbers(a, b, c, d, e, f, g)
    sum = 0
    collectedNumbers = {a, b, c, d, e, f, g}

    for number = 1, #collectedNumbers do
        if collectedNumbers[number] % 3 == 0 then
            sum = sum + collectedNumbers[number]
        end
  end
    return sum
end

print(calculateNumbers(3, 5, 6, 7, 9, 12, 34))
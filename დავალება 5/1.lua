function calculateArea(a, b, c)
    s = (a + b + c) / 2
    result = math.sqrt((s * (s - a) * (s - b) * (s - c)))
    return result
end

print(calculateArea(10, 11, 9))

function forceDig(distance)
    for i = 0, distance do
        while not turtle.forward() do
            turtle.dig()
        end
    end
end
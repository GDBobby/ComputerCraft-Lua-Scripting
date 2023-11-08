function ForceMove()
    --possibility for it to be a mob attacking, in which case i'd want turtle.attack()
    --not currently an issue
    while not turtle.forward() do
        turtle.dig()
    end
end

function ForceUp()
    while not turtle.up() do
        turtle.digUp()
    end
end

--x is forward from initial direction
--y is side
--z is vertical

function ClearArea(x, y, z)
    for k = 1, z do
        for j = 1, y do
            for i = 1, x do
                ForceMove()
            end
            turtle.turnRight()
            ForceMove()
            turtle.turnRight()
        end
        ForceUp()
    end
end

ClearArea(2, 3, 3)

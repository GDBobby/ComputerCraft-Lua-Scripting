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

function digLine()
    for i = 0, 15 do
        turtle.digUp()
        ForceMove()
        turtle.digUp()
    end
end
function shiftLineRight()
    turtle.turnRight()
    ForceMove()
    turtle.digUp()
    turtle.turnRight()
end 
function shiftLineLeft()
    turtle.turnLeft()
    ForceMove()
    turtle.digUp()
    turtle.turnLeft()
end
function digSegment()
    digLine()
    shiftLineRight()
    digLine()
    shiftLineLeft()
end
function digLevel()
    for i = 0, 7 do
        digSegment()
    end
end

function digRoom()
    for i = 0, 7 do
        digLevel()
        turtle.turnLeft()
        for j = 0, 15 do
            ForceMove()
        end
        turtle.turnRight()
        ForceUp()
        ForceUp()
    end
    for i = 0, 15 do
        turtle.down()
    end
end

digRoom()

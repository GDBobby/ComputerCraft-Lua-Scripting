function digLine()
    for i = 0, 15 do
        turtle.digUp()
        turtle.dig()
        turtle.forward()
    end
    turtle.digUp()
end
function shiftLineRight()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.turnRight()
end 
function shiftLineLeft()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
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
            turtle.forward()
        end
        turtle.turnRight()
        turtle.up()
        turtle.digUp()
        turtle.up()
    end
    for i = 0, 15 do
        turtle.goDown()
    end
end

digRoom()

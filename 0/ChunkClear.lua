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
function ForceDown()
    while not turtle.down() do
        turtle.digDown()
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

function GoToBottom(startingHeight)
    for i = -55, startingHeight do
        ForceDown()
    end
end

function ReturnToPosition(startingHeight, currentHeight)
    for i = startingHeight, currentHeight do
        ForceDown()
    end
end
function GoNextLevel()
    turtle.turnLeft()
    for j = 0, 15 do
        ForceMove()
    end
    turtle.turnRight()
    ForceUp()
    ForceUp()
end

function ChunkClear(startingHeight, clearHeight)
    GoToBottom(startingHeight)

    local heightDistance = clearHeight + 55
    heightDistance = heightDistance / 2

    for i = 0, heightDistance do
        digLevel()
        GoNextLevel()
    end

    ReturnToPosition(startingHeight, clearHeight)
end

ChunkClear(11, 100)

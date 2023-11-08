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

function ClearArea(x, y, z)
    for k = 1, z do
        for j = 1, y do
            for i = 2, x do
                ForceMove()
            end
            if not (j == y) then
                if(j % 2) == 1 then
                    turtle.turnRight()
                    ForceMove()
                    turtle.turnRight()
                else
                    turtle.turnLeft()
                    ForceMove()
                    turtle.turnLeft()
                end
            else
                if(j % 2) == 1 then
                    turtle.turnLeft()
                    turtle.turnLeft()
                else
                    turtle.turnRight()
                end
            end
        end
        if not (k == z) then
            ForceUp()
        end
    end
    --when odd X, at opposite forward
    --when odd Y, facing towards start
    --when odd Z, ??
    

end

function Inspection()
        print("found diamond")
        --turtle.back()
        ForceDown()
        turtle.turnLeft()
        ForceMove()
        turtle.turnRight()
        ClearArea(3,3,3)
        turtle.turnRight()
        ForceMove()
        turtle.turnRight()
        turtle.down()
        turtle.back()
end

function InspectMove()
    local has_block, block_data = turtle.inspect()

    if has_block then
        local startPos = string.find(block_data["name"], "diamond")
        if startPos then
            Inspection()
        else
            ForceMove()
        end
    else
        ForceMove()
    end
end




function Refuel(distanceTraveled, travelSegment)
    local fuelLevel = turtle.getFuelLevel()
    while fuelLevel < 10000 and turtle.getItemCount(16) > 0 do 
        turtle.select(16)
        turtle.refuel(5)
        fuelLevel = turtle.getFuelLevel()
        print("refueling,", fuelLevel)
    end
    turtle.select(1)
    return fuelLevel > (distanceTraveled + travelSegment)
end

function deposit()
    for i = 1, 15 do
        turtle.select(i)
        turtle.dropDown()
    end
end


function checkFullInv()
    local itemCount = turtle.getItemCount(15)
    if itemCount > 0 then
       print("full inventory : ", itemCount)
        return true
    else
        return false
    end 
end

function checkCoal()
    local coalCount = turtle.getItemCount(16)
    return coalCount
end    

function mining(numMove)
    local moved = 0
    for i = 1, numMove do
        InspectMove()
        moved = moved + 1
    end
    moved = 0
    print("mining returning : ", moved)
    return numMove 
end
function Comeback(distance)
    print("come back distance : ", distance)
    for i = 1, distance do
        InspectMove()
    end
end

function miningWrapper(initialCoalCount, travelDistance)
    print(initialCoalCount)
    local coalCount = checkCoal()
    local distanceTraveled = 0
    local remainingFuel = coalCount * 80

    local travelSegment = 16

    while Refuel(distanceTraveled, travelSegment) and (distanceTraveled < travelDistance) do
        distanceTraveled = distanceTraveled + mining(travelSegment)
        coalCount = checkCoal()
        if coalCount <= initialCoalCount then
            print("low on coal")
        end
        if checkFullInv() then
            print("full inventory")
            coalCount = 0
        end           
    end
    ForceUp()
    ForceUp()
    turtle.turnRight()
    turtle.turnRight()
    print(distanceTraveled)
    Comeback(distanceTraveled)
end



print(Refuel(0, 0))
local initialCoalCount = checkCoal()
--print("coal count : ")
initialCoalCount = initialCoalCount / 2
print(initialCoalCount)
turtle.select(1)



--ClearArea(3,3,3)
--InspectMove()

miningWrapper(initialCoalCount, 64)


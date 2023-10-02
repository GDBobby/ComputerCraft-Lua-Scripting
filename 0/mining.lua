function refuel()
    local fuelLevel = turtle.getFuelLevel()
    while fuelLevel < 10000 and turtle.getItemCount(16) > 0 do 
        turtle.select(16)
        turtle.refuel(5)
        fuelLevel = turtle.getFuelLevel()
        print("refueling,", fuelLevel)
    end
    turtle.select(1)
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
    for i = 0, numMove do
        turtle.dig()
        while not turtle.forward() do
            turtle.dig()
        end
        moved = moved + 1
    end
    moved = 0
    return numMove     
end
function comeback(distance)
    for i = 0, distance do
        if not turtle.forward() then
            turtle.dig()
            i = i - 1
       end     
    end
end

function miningWrapper(initialCoalCount)
    print(initialCoalCount)
    local coalCount = checkCoal()
    local distanceTraveled = 0
    while coalCount > initialCoalCount and distanceTraveled < 1000 do
        distanceTraveled = distanceTraveled + mining(1)
        refuel()
        coalCount = checkCoal()
        if coalCount <= initialCoalCount then
            print("low on coal")
        end
        if checkFullInv() then
            print("full inventory")
            coalCount = 0
        end           
    end
    turtle.turnRight()
    turtle.turnRight()
    print(distanceTraveled)
    comeback(distanceTraveled)
end

refuel()
local initialCoalCount = checkCoal()
print("coal count : ")
initialCoalCount = initialCoalCount / 2
print(initialCoalCount)
turtle.select(1)

deposit()

--miningWrapper(initialCoalCount)


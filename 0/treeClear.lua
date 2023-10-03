function ForceForward()
    --possibility for it to be a mob attacking, in which case i'd want turtle.attack()
    --not currently an issue
    while not turtle.forward() do
        turtle.dig()
    end
end

function PlantSwap()
    if not turtle.placeDown() then
        turtle.select(14)
        if not turtle.placeDown() then
            turtle.select(15)
            turtle.placeDown()
        end
    end
end

function Refuel()
    local fuelLevel = turtle.getFuelLevel()
    while fuelLevel < 10000 and turtle.getItemCount(16) > 0 do 
        turtle.select(16)
        turtle.refuel(5)
        fuelLevel = turtle.getFuelLevel()
        print("refueling,", fuelLevel)
    end
    turtle.select(1)
end

function RestockSaps()
    local saplingCount15 = turtle.getItemCount(15)
    local saplingCount14 = turtle.getItemCount(14)
    if saplingCount15 == 64 and saplingCount14 == 64 then
        return
    end
    local needSap14 = 64 - saplingCount14
    local needSap15 = 64 - saplingCount15

    for i = 1, 13 do
        if turtle.getItemCount(i) > 0 then
            local sapInspect = turtle.getItemDetail(i)

            local sapName = sapInspect["name"]
            local startPos = string.find(sapName, "sapling")
            if startPos then
                turtle.select(i)
                if saplingCount14 ~= 64 then
                    turtle.transferTo(14, needSap14)
                    saplingCount14 = turtle.getItemCount(14)
                    needSap14 = 64 - saplingCount14
                end
                if saplingCount14 == 64 then
                    turtle.transferTo(15, needSap15)
                    saplingCount15 = turtle.getItemCount(15)
                    if saplingCount15 == 64 then
                        return
                    end
                    needSap15 = 64 - saplingCount15
                end
            end
        end
    end
end

function DepositAll()
    RestockSaps()

    for i = 1, 13 do
        turtle.select(i)
        turtle.dropDown()
    end
end

function Inspection()
    local has_block, treeInspect = turtle.inspect()
    --local treeName = treeInspect["name"]
    if has_block then
        local treeName = treeInspect["name"]
        local startPos, endPos = string.find(treeName, "log")
        if startPos then
            return true
        end
    end
    return false
end
function UpInspection()
    local has_block,treeInspect = turtle.inspectUp()
    if has_block then
        local startPos = string.find(treeInspect["name"], "log")
        if startPos then
            return true
        end
    end
    return false
end

function ClearTree()
    turtle.dig()
    ForceForward()
    while UpInspection() do
        turtle.digUp()
        turtle.up()
    end
    while turtle.down() do
    end
end

function ClearDoubleRow()
    for i = 0, 8 do
        ClearTree()
        ForceForward()
        ForceForward()
    end
    ClearTree()
    ForceForward()
    turtle.turnLeft()
    ForceForward()
    ForceForward()
    ForceForward()
    turtle.turnLeft()

    for i = 0, 8 do
        ClearTree()
        ForceForward()
        ForceForward()
    end
    ClearTree()
end

function GoNextChopDoubleRowPosition()
    ForceForward()
    turtle.turnRight()
    ForceForward()
    ForceForward()
    ForceForward()
    turtle.turnRight()
end
function ClearFullGrove()
    Refuel()
    ClearDoubleRow()
    GoNextChopDoubleRowPosition()
    ClearDoubleRow()
    GoNextChopDoubleRowPosition()
    ClearDoubleRow()
    ForceForward()
    turtle.turnLeft()
    for i = 0, 14 do
        ForceForward()
    end
    DepositAll()
    turtle.turnLeft()
end

function SuckMove()
    ForceForward()
    turtle.suckDown()
end


function SuckDoubleRow()
    for i = 0, 28 do
        SuckMove()
    end
    turtle.turnLeft()
    ForceForward()
    turtle.turnLeft()
    for i = 0, 28 do
        SuckMove()
    end
end

function GoNextSuckRow()
    turtle.turnRight()
    ForceForward()
    turtle.turnRight()
end

function SuckFullGrove()
    turtle.up()
    turtle.turnRight()
    ForceForward()
    turtle.turnLeft()
    turtle.suckDown()
    for i = 0, 6 do
        SuckDoubleRow()
        GoNextSuckRow()
    end
    SuckDoubleRow()
    turtle.turnLeft()
    for i = 0, 13 do
        ForceForward()
    end
    turtle.down()
    turtle.turnLeft()
    DepositAll()
end

function PlantDoubleRow()
    turtle.select(15)
    for i = 0, 8 do
        ForceForward()
        PlantSwap()
        ForceForward()
        ForceForward()
    end
    ForceForward()
    PlantSwap()
    ForceForward()
    turtle.turnLeft()
    ForceForward()
    ForceForward()
    ForceForward()
    turtle.turnLeft()
    for i = 0, 8 do
        ForceForward()
        PlantSwap()
        ForceForward()
        ForceForward()
    end
    ForceForward()
    PlantSwap()
end

function PlantFullGrove()
    turtle.up()
    PlantDoubleRow()
    GoNextChopDoubleRowPosition()
    PlantDoubleRow()
    GoNextChopDoubleRowPosition()
    PlantDoubleRow()
    ForceForward()
    turtle.turnLeft()
    for i = 0, 14 do
        ForceForward()
    end
    turtle.down()
    DepositAll()
    turtle.turnLeft()
end

function ClearDoubleGrove()

    ClearFullGrove()
    SuckFullGrove()
    PlantFullGrove()
    turtle.turnLeft()
    for i = 0, 17 do
        ForceForward()
    end
    turtle.turnRight()

    ClearFullGrove()
    SuckFullGrove()
    PlantFullGrove()
    turtle.turnRight()
    for i = 0, 17 do
        ForceForward()
    end
    turtle.turnLeft()
end

ClearDoubleGrove()



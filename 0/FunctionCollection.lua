--need to include this as a library in each other program

function ForceMove(distance)
    while not turtle.forward() do
        turtle.dig()
    end
end

function Refuel()
    local fuelLevel = turtle.getFuelLevel()
    while fuelLevel < 10000 and turtle.getItemCount(16) > 0 do 
        turtle.select(16)
        turtle.refuel(10)
        fuelLevel = turtle.getFuelLevel()
        --print("refueling,", fuelLevel)
    end
    turtle.select(1)
end
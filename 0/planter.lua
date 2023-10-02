function plantOne()
    turtle.forward()
    turtle.forward()
    turtle.digDown()
    turtle.placeDown()
    turtle.forward()
    turtle.turnRight()
    turtle.turnRight()
    turtle.select(3)
    turtle.place()
    turtle.turnRight()
    turtle.turnRight()
    turtle.select(1)
end

function plantDoubleRow()
    for i = 0, 4 do
        plantOne()
    end
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    for i = 0, 4 do
        plantOne()
    end
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    
end

for i = 0, 7 do
    plantDoubleRow()
end

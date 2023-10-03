--print(textutils.serialize(peripheral.getNames()))

local modem = peripheral.getNames()
local modem2 = peripheral.wrap("right")

--print(textutils.serialize(peripheral.getNames()))

print(textutils.serialize(peripheral.getNames()))
print(textutils.serialize(modem2.getNamesRemote()))

    --"minecraft:furnace_0"
    --pushItems(chestName, 1, 64, 1)
--print(chestName)
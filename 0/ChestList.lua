local chest = peripheral.wrap("bottom")
for slot, item in pairs(chest.list()) do
    print(("%d x %s in slot %d"):format(item.count, item.name, slot))
end

--local chestMethods = peripheral.getMethods("front");
--print(textutils.serialize(chestMethods));

print(textutils.serialize(chest.list()))
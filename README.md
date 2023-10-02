# ComputerCraft-Lua-Scripting

https://tweaked.cc/
Just using this as a fun exercise to learn Lua. Sharing the work along the way I guess.

## Functionality

### Tree Harvester

Chops trees, grabs the loot, and replants saplings in one command.
Currently works in a 5x10 birch tree grid, which are planted every 3rd block (2 spaces between each)

### Mining - WIP

Currently the miner is turning off when it gets out of range of the player. From what I've read the best way to fix it is to make a custom mod just to force the turtle's chunks to update.

### Room Clearing

Fuel intensive
Clears a room that is 16x16x32
Currently a bug that makes it go 16x16x32 instead of 16^3
Returns to starting position at the end

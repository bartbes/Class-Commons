--this example uses the secs reference implementation
--which is pretty basic and included in the repo
--you should be able to use any other implementation
--but you'll have to update this file
--(treesandents.lua should remain untouched)
if not
	pcall(require, "reference.secs")
or not
	pcall(require, "example.treesandents")
then
	print("You are running it in the wrong directory, run it from the main directory as 'lua example/example.lua'")
	return
end

local tree = Ent:new()
io.write("Grow: ")
tree:grow() --> Is a big tree now!
io.write("Chop: ")
tree:chop() --> I am no tree, I am an ent!

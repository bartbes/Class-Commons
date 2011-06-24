Tree = {}
function Tree:grow()
    print("Is a big tree now!")
end

function Tree:chop()
    print("Chopped down a tree.")
end

Ent = {}
function Ent:chop()
    print("I am no tree, I am an ent!")
end

Tree = common.class("Tree", Tree)
Ent = common.class("Ent", Ent, Tree)

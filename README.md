# Class Commons #
*Class Commons* is a project to provide a common compatibility interface for class systems. The goal of this is to make libraries independent of class libraries, a library using the Class Commons API can then be used with any class system adhering to it (albeit via a compatibility layer).

## Specification ##

### Features ###
* Single-class inheritance
* Constructors
* Instance methods
* Polymorphism

Class definition is single-write read-only, so the entire class has to be defined on creation.

### Functions ###
	class = common.class(name, table, parents...)
	instance = common.instance(class, ...)

### Class constructors ###
Constructors are defined by the special `init` function:

	foo = common.class("foo", {})
	function foo:init()
		self.bar = "baz"
	end

Derived classes may access the super class constructors by using `<super>.init`, but
ONLY if the parent was created using common.class:

	foo = common.class("foo", {init = function(self) self.foo = true end})
	bar = common.class("bar", {init = function(self) foo.init(self) end})

NOTE: Accessing `<super>.init` from classes not created with common.class yields
      undefined behaviour.

### Instances ###
Instances may be created using `common.instance`:

	foo = common.class("foo", {init = function(self, bar) self.bar = bar end}
	baz = common.instance(foo, 'baz')

#### Example ####
	local Tree = {}
	function Tree:grow()
		print("Is a big tree now!")
	end

	function Tree:chop()
		print("Chopped down a tree.")
	end

	local Ent = {}
	function Ent:chop()
		print("I am no tree, I am an ent!")
	end
	
	Tree = common.class("Tree", Tree)
	Ent = common.class("Ent", Ent, Tree)

	local tree = common.instance(Ent)
	tree:grow() --> Is a big tree now!
	tree:chop() --> I am no tree, I am an ent!

## Participating libraries ##
* [SECS][]
* [Slither][]
* [MiddleClass][]
* [hump.class][]
* [30log.class][]

## Repository information ##
This repository will both contain documentation (like this very document) and tests. (Note: located in a subrepository.)
The authors of participating libraries all get write access, and are free, and encouraged, to collaborate.

[SECS]: http://love2d.org/wiki/Simple_Educative_Class_System
[Slither]: http://bitbucket.org/bartbes/slither
[MiddleClass]: http://github.com/kikito/middleclass/wiki
[hump.class]: http://vrld.github.com/hump/#class
[30log.class]: https://github.com/Yonaba/30log

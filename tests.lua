tests = {}

tests["Existance of common.class"] = function()
	assert(common.class, "common.class is not exported!")
end

tests["Creating a class"] = function()
	local t = {}
	t = common.class("Creating a class", t)
	assert(t)
end

tests["Instantiation"] = function()
	local c = common.class("Instantiation", {})
	local o = instantiate(c)
	assert(o)
end

tests["Accessing members"] = function()
	local c = common.class("Accessing members", {member = true})
	local o = instantiate(c)
	assert(o.member)
end

tests["Inheritance"] = function()
	local c1 = common.class("Inheritance", {member = true})
	local c2 = common.class("Inheritance2", {}, c1)
	local o = instantiate(c2)
	assert(o.member)
end

tests["Calling members"] = function()
	local c = common.class("Calling members", {member = function() return true end})
	local o = instantiate(c)
	assert(o.member and o.member())
end

tests["Self-test"] = function()
	assert(false, "Tests work.")
end

--log it all to the terminal
function log(type, message)
	if type == "implementation" then
		print("Testing implementation: " .. message)
	elseif type == "test" then
		print("  Test " .. message .. ":")
	elseif type == "success" then
		print("      SUCCESS")
	elseif type == "fail" then
		print("      FAIL: " .. message)
	end
end

--run all tests on an implementation
function run(implementation)
	log("implementation", implementation)
	--make sure we load the api
	common_class = true
	--load the implementation
	require(implementation)
	--load the test interface for the implementation
	require(implementation .. "_test")
	--tun all tests
	for i, v in pairs(tests) do
		log("test", i)
		local ok, err = pcall(v)
		if not ok then
			log("fail", err)
		else
			log("success")
		end
	end
end

--for all arguments run the tests
--where arguments are requirable
--implementation names
for i, v in ipairs{...} do
	setfenv(run, setmetatable({}, {__index = _G}))
	run(v)
end

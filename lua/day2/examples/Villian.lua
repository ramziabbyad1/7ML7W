Villian = {health = 100}

function Villian:new(name)
	local obj = {
		name = name,
		health = self.health
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function Villian:take_hit()
	self.health = self.health - 10
end

SuperVillian = Villian:new()

function SuperVillian:take_hit()
	self.health = self.health - 5
end

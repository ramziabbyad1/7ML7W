dietrich = {
	name = "Dietrich",
	health = 100,

	take_hit = function(self)
		self.health = self.health - 10
	end
}

print("dietrich.health")
print(dietrich.health)
dietrich.take_hit(dietrich)
print("dietrich.take_hit(dietrich)")
print(dietrich.health)
print("the niave way to clone is property wise copying")
clone = {
	name = dietrich.name,
	health = dietrich.heatlh,
	take_hit = dietrich.take_hit
}

print("clone.health")
print(clone.health)

print("\n\ninstead of copying properties let's use prototypes")
Villian = {
	health = 100,
	new = function(self, name)
		local obj = {
			name = name,
			health = self.health
		}
		return obj
	end,

	take_hit = function(self)
		self.health = self.health - 10
	end
}

print("dietrich = Villian.new(Villian, \"Dietrich\")")
print("Villian.take_hit(dietrich)")
print("dietrich.health")
dietrich = Villian.new(Villian, "Dietrich")
Villian.take_hit(dietrich)
print(dietrich.health)
print("dietrich.take_hit(dietrich) will throw exception")
--dietrich.take_hit(dietrich)

Villian = {
	health = 100,
	new = function(self, name)
		local obj = {
			name = name,
			health = self.health
		}
		setmetatable(obj, self)
		self.__index = self
		return obj
	end,

	take_hit = function(self)
		self.health = self.health - 10
	end
}

print("dietrich = Villian.new(Villian, \"Dietrich\")")
dietrich = Villian.new(Villian, "Dietrich")
print("\n\nby using metatables we set the behaviour to that of Villian table")
print("note, this is done using self.__index = self within the new function")
print("dietrich.take_hit(dietrich)")
dietrich.take_hit(dietrich)
print("dietrich.health")
print(dietrich.health)

print("\n\nwe can even do inheritance this way")
print("\nSuperVillian = Villian.new(Villian)")
SuperVillian = Villian.new(Villian)
print("\nfunction SuperVillian.take_hit(self) \n self.health = self.health - 5 \nend")
function SuperVillian.take_hit(self)
	self.health = self.health - 5
end
toht = SuperVillian.new(SuperVillian, "Toht")
toht.take_hit(toht)
print('\ntoht = SuperVillian.new(SuperVillian, "Toht") \ntoht.take_hit(toht)')
print("\ntoht.health after hit: " .. toht.health)

print("\n\ninstead of writing the table name repeatedly lets use some sugar")
print("thus creating a primitive class file")
dofile('Villian.lua')

print('\ndietrich = Villian:new("Dietrich") \ntoht = SuperVillian:new("Toht")')
dietrich = Villian:new("Dietrich")
toht = SuperVillian:new("Toht")

print('dietrich:take_hit()\ntoht:take_hit()')
dietrich:take_hit()
toht:take_hit()

print("dietrich.health")
print(dietrich.health)
print("toht.health")
print(toht.health)

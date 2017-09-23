greek_numbers = {
	ena = "one",
	dyo = "two",
	tria = "three"
}

print("getmetatable(greek_numbers)")
print(getmetatable(greek_numbers))

print("dofile('util.lua')")
dofile('util.lua')

print("set a mt table as meta table with __tostring custom method")
mt = {
	__tostring = table_to_string
}

print("setmetatable(greek_numbers, mt)")
setmetatable(greek_numbers, mt)

print("print(greek_numbers)")
print(greek_numbers)

--accessor logic
print("\n\nimplementing custom read/write behavior")
print("treasure = {}")
treasure = {}
print("dofile('strict.lua')")
dofile('strict.lua')
set_strict_read_write(treasure)
print("treasure.gold = 100")
treasure.gold = 100
print("treasure.gold")
print(treasure.gold)
print("treasure.silver")
print(treasure.silver)
print("treasure.gold = 200")
treasure.gold = 200

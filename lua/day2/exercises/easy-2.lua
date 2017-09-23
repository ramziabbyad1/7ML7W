local _private = {}

function strict_write(table, key, value)
	if _private[key] and value then error("That's cheating") end
	_private[key] = value
end

local mt = {
	__newindex = strict_write
}

tbl = {}
setmetatable(tbl, mt)

tbl[1] = nil
tbl[2] = 2
tbl[3] = 5
tbl[4] = 1
tbl[1] = 1
tbl[3] = nil
tbl[3] = 4

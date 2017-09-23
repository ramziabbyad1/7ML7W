require '../examples/util'

local function append(des, src, i, J)
	if src[i] == nil then return des end
	des[J.j] = src[i]
	J.j = J.j + 1
	return append(des, src, i+1, J)
end


local function concat(J, acc, a, ...)
	if a == nil then return acc end
	return concat(J, append(acc, a, 1, J), ...)
end

--only handles concatenation with non-null entries
function concatenate(a, ...)
	return concat({j = 1}, {}, a, ...)
end

--operator overloading, when a global variable is assigned it gets some new behavior
setmetatable(_G, {
	__newindex = function(tbl, k, v)
		if type(v) == 'table' then
			setmetatable(v, {__add=concatenate}) 
		end
		rawset(tbl, k, v)
	end
})
for n in pairs(_G) do print(n) end
arr1 = {1,2,3,4}
arr2 = {5,6,7,8}
arr3 = {'hotdogs', 'hamburgers'}
table_to_string(arr1)
print(table.unpack(arr1+arr2+arr3))
x=3 + 4
print(x)
--
--x = arr1 +arr2
--print(table_to_string(x))

--print(rawget(getmetatable(4), '__add'))

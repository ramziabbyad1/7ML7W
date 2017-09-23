require '../examples/util'

--uncomment debug.traceback to see the affect of tail recursion on the stack
local function append(des, src, i, J)
	if src[i] == nil then return des end
	des[J.j] = src[i]
	J.j = J.j + 1
	print(debug.traceback())
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

a1 = {'apples', 'oranges', 'tomcatos'}
a2 = {49, 100, -10}
a3 = {'hello', 'world'}
a4 = {'two', 2}
a5 = {49, 100, -10}
a6 = {49, 100, -10}
a7 = {49, 100, -10}
--print(table.unpack(b))
--print(table.unpack(a1))
--print(table.unpack(a2))
--cat(b, a1, a2)
res = concatenate(a1, a2, a3, a4, a5, a6, a7)
print(table_to_string(res))
--res=concat(a1, a2)
--print(table_to_string(res))


--print(table.unpack(concatenate({}, a1, a2)))

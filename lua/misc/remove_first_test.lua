local function remove_first(array)
	result = array[1]
	array[1] = array[#array]
	array[#array] = nil
	return result
end

local function print_array(a)
	for k,v in pairs(a) do
		print(k .. ' ' .. v)
	end
end
a={1,2,3,4}
while #a > 0 do
	print('first')
	print(remove_first(a))
	print('remaingin')
	print_array(a)
end

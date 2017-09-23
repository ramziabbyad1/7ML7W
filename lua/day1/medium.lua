function for_loop(a,b,f)
	local i = a
	while i<= b do
		f(i)
		i = i + 1
	end
end

for_loop(4,3,print)

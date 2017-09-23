function reduce(max, init, f)
	if init == max then return init end
	return f(init, reduce(max, init + 1, f))
end

function add(previous, next)
	return previous + next
end

function multiply(previous, next)
	return previous*next
end

function factorial(num)
	return reduce(num,2,multiply)
end

function max(a,b)
	if a > b then return a else return b end
end
--nice and fast!
print(reduce(3, 1, add))
print(reduce(5, 2, add))
print(reduce(100, 2, add))
print(factorial(6))
print(factorial(16))
print(reduce(200, 17, max))

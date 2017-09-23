function ends_in_three(num)
	if (num % 10) == 3 then return true else return false end
end


print('first prob')
print('ends_in_three(2) = ' .. tostring(ends_in_three(2)))
print('ends_in_three(54813) = ' .. tostring(ends_in_three(54813)))

function is_prime(num)
	local i = 2
	while i*i <= num do
		if num % i == 0 then
			return false
		end
		i=i+1
	end
	return true
end

print (is_prime(2))
print (is_prime(101))
print (is_prime(401))
print (is_prime(301))
print (is_prime(401))

function first_n_primes(n)
	local count = 0
	local current_num = 3
	while count < n do
		if (is_prime(current_num) and ends_in_three(current_num)) then
						print(current_num)
						count = count + 1
		end
		current_num = current_num + 1
	end
end

print("first_n_primes(0)")
first_n_primes(0)
print("first_n_primes(2)")
first_n_primes(2)
print("first_n_primes(5)")
first_n_primes(5)
print("first_n_primes(10)")
first_n_primes(10)

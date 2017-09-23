function retry(count, body)
	if count == 0 then print('max count reached!') return end
	generator = coroutine.create(body)
	succeeded, value = coroutine.resume(generator)
	if value == nil then
		return
	else
		print(value)
		return retry(count - 1, body) 
	end
end

retry(
	15,

	function()
		math.randomseed(os.time())
		math.random() math.random() math.random()
		r = math.random()
		if r > .7 then
			coroutine.yield('Something bad happened.')
		end
		print('Succeeded')
	end

)

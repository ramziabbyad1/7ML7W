--require '../examples/util'

local Queue = { capacity = 10, first, last, length, arr   } --specify the data model in form of object
Queue.__index = Queue																				--specify lookup behavior for any object which has same metatable as Queue
Queue.__tostring = function(tbl)														--print(Queue) magic

	local str_tbl = {}
	str_tbl[#str_tbl+1] = '::Queue Contents::'
	str_tbl[#str_tbl+1] ='Length ='..tbl.length
	str_tbl[#str_tbl+1] = 'Capacity ='..tbl.capacity
	str_tbl[#str_tbl+1] ='First ='..tbl.first
	str_tbl[#str_tbl+1] = 'Last ='..tbl.last

	for idx=tbl.first,tbl.first+tbl.length-1 do
		itr_idx = ((idx == (tbl.capacity + 1)) and 1 ) or  idx
		str_tbl[#str_tbl+1] = 'queue['.. itr_idx ..'] = '..tbl.arr[itr_idx]
	end
	
	return table.concat(str_tbl, '\n')
end

function Queue.new()
	local self = setmetatable({}, Queue)    			--set default values and behaviors through prototypal inheritance
	self.first = 1 self.last = 0 self.length = 0
	self.arr = setmetatable({}, {									--set insert/remove behavior on underlying array data structure
		__newindex = function(arr, idx, val) 
			
			if val == nil and self.length == 0 then
				error('Queue empty!')
			elseif self.length == self.capacity then 
				error('Queue overflow!')
			end
			
			rawset(arr, idx, val)

		end
	})
	return self
end

function Queue:insert(val)
	local arr = self.arr
	local cap = self.capacity
	self.last = (self.last % cap) + 1
	local new_last = self.last
	arr[new_last] 	= 	val
	self.length = self.length + 1
end

function Queue:remove()
	local arr = self.arr
	local first = self.first
	local cap = self.capacity
	arr[first] 	= 	nil
	self.first = (self.first + 1) % cap
	self.length = self.length - 1
end

q = Queue.new()
print('empty queue')
print(q)
q:insert(20)
print('\ninsert')
print(q)
q:remove()
print('\nremove')
print(q)
q:insert(30)
q:insert(40)
q:insert(20)
print('\n3 inserts')
print(q)
q:remove()
print('\n1 remove')
print(q)
q:insert(30)
q:insert(30)
q:insert(30)
q:insert(30)
q:insert(30)
q:insert(30)
q:insert(30)
print('\n7 inserts')
print(q)

--q:remove()
--q:insert(40)
--q:insert(20)
--q:insert(30)
--q:remove()
--q:insert(40)
--q:remove()
--
--q:insert(40)
--
--q:insert(40)
--print(q.length)
--print(q.capacity)
--print(q == nil)
--print(q.length)
--print(q.arr[1])
--print(q.arr[2])
--print(q.arr[3])
--print(q.arr[4])



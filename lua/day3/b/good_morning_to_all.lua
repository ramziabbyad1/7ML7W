print ('loading good_morning_to_all.lua')
notes = {
	'D4q',
	'E4q',
	'D4q',
	'G4q',
	'Fs4h'
}
print ('#notes = ' .. #notes)
print ('importing scheduler')
local scheduler = require 'scheduler'
print ('imported scheduler')
local notation 	= require 'notation'
print ('imported notation')
--assert scheduler
--assert notation

print ('scheduler and notation are defined')
print (scheduler)
print (notation)

function play_song()
	print('calling play_song')
	print(notation)
	print(#notes)
	for i = 1, #notes do
		print(notes[i])
		local symbol = notation.parse(notes[i])
		print('symbol')
		print(symbol)
		notation.play(symbol.note, symbol.duration)
	end
end

scheduler.schedule(0.0, coroutine.create(play_song))
scheduler.run()



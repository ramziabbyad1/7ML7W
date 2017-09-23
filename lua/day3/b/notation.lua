--print('importing scheduler')
local scheduler = require 'scheduler'
--print('scheduler imported succesfully')

local function note(letter, octave)
	--print ('note('..letter..', '..octave..')')
	if letter == 'X' then  return -1 end
	
	local notes = {
		C = 0, Cs = 1, D = 2, Ds = 3, E = 4,
		F = 5, Fs = 6, G = 7, Gs = 8, A = 9,
		As = 10, B = 11
	}

	
	local notes_per_octave = 12

	out = (octave + 1) * notes_per_octave + notes[letter]
	--print(out)
	return out
end

local tempo = 100

-- h (half), q (quarter), e (eigth), s (sixteenth), ed (dotted eigth: 3/16th)
local function duration(value)
	local quarter = 60 / tempo
	local durations = {
		w   = 4.00,
		hd  = 3.00,
		h 	= 2.00,
		qd	= 1.50,
		q 	= 1.00,
		ed	= 0.75,
		e 	= 0.50,
		s 	= 0.25
	}
	out = durations[value] * quarter
	--print('duration ' .. out)
	return out
end

local function parse_note(s)
	--print('parsing note ' .. s)
	local letter, octave, value =
		string.match(s, "([A-GsX]+)(%d+)(%a+)")

	--print('letter '.. letter)
	--print('octave '.. octave)
	--print('value '.. value)
	if not (letter and octave and value) then
		return nil
	end	

	return {
		note = note(letter, octave),
		duration = duration(value)
	}
end

local NOTE_DOWN = 0x90
local NOTE_UP 	= 0x80
local VELOCITY  = 0x7f

local function play(note, duration)
	--print('play called in notation')
	if note == -1 then
		scheduler.wait(duration)
	else
		midi_send(NOTE_DOWN, note, VELOCITY)
		scheduler.wait(duration)
		midi_send(NOTE_UP, note, VELOCITY)
	end
end

local function part(t)
	local function play_part()
		for i=1,#t do
			play(t[i].note, t[i].duration);
		end
	end	

	scheduler.schedule(0.0, coroutine.create(play_part))
end

local mt = {
	__index = function(t, s)
		local result = parse_note(s)
		return result or rawget(t,s)
	end
}

setmetatable(_G, mt)

local function set_tempo(bpm)
	tempo = bpm
end

local function go()
	scheduler.run()
end

--print('returning?')

return {
	parse = parse_note,
	play 	= play,
	part 	= part,
	set_tempo = set_tempo,
	go = go
}


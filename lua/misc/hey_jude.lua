print('loading notation file')
song = require 'notation'
print ('load notation worked')
--REMEMBER, TREBLE CLEF IS G-CLEF NOT E-CLEF, THAT IS BASS-CLEF
song.set_tempo(74)
--it falls on G4 normally, in this case it is G3
--melody
song.part{
	C5q, --bar 
	A4q, X8qd, A4e, C5e, D5e, 
	G4h, X8q, G4e, A4e,
	As4q, F5qd, F5e, E5e, C5e,
	D5e, C5s, As4s, A4h, X8e, C5e,
	D5e, D5e, X8e, D5e, G5s, F5e, E5e, F5s, D5e, 
	C5h, F4e, G4e, A4e, D5e, --7
	D5e, C5e, X8e, C5e, As4e, A4e, E4e, E4e,
	F4e, F4qd, X8q, C5q, --9
	A4h, X8e, A4e, C5e, D5e,
	G4h, X8q, G4e, A4e,
	As4q, F5qd, F5e, E5e, C5e,
	D5e, C5s, As4s, A4h, X8e, C5e, --page 1

}
--treble piano
song.part{
	X8q, 
	F4q, F4q, F4q, F4q,
	C4q, C4q, C4q, C4e, C4e,
	C4q, F4q, F4q, F4q,
	F4q, F4q, F4q, F4q,
	F4q, F4q, F4q, F4q,
	F4q, F4q, F4q, F4q, --7
	C4q, C4q, C4q, C4q, 
	F4q, F4q, F4h, 
	F4q, F4q, F4q, F4q, 
	C4q, C4q, C4q, C4e, C4e,
	C4q, F4q, F4q, F4q,
	F4q, F4q, F4q, F4q, --page 1
}
song.part{
	X8q, 
	C4q, C4q, C4q, C4q,
	G3q, G3q, G3q, G3e, A4e,
	As4q, As4q, As4q, As4q,
	C4q, C4q, C4q, C4q,
	D4q, D4q, D4q, D4q,
	C4q, C4q, C4q, C4q, --7
	G3q, G3q, G3q, G3q,
	C4q, C4q, C4h, 
	C4q, C4q, C4q, C4q,
	G3q, G3q, G3q, G3e, A4e,
	As4q, As4q, As4q, As4q,
	C4q, C4q, C4q, C4q,--page 1
}
song.part{
	X8q, 
	A4q, A4q, A4q, A4q,
	E3q, E3q, E3q, E3e, F3e,
	G3q, G3q, G3q, G3q,
	A4q, A4q, A4q, A4q,
	As3q, As3q, As3q, As3q,
	A4q, A4q, A4q, A4q, --7
	As3q, As3q, As3q, As3q,
	A3q, A3q, A3h, 
	A3q, A3q, A3q, A3q, 
	E3q, E3q, E3q, E3e, F3e,
	G3q, G3q, G3q, G3q,
	A3q, A3q, A3q, A3q,--page 1
}
--
----bass piano
song.part{
	X8q, 
	F1w,
	C2w,
	C2w,
	F1w,
	As1w,
	F1w, --7
	C2w,
	F1h, F1h,
	F1w,
	C2w,
	C2w,
	F1w,--page 1
}

song.part{
	X8q, 
	X8e, F2q, F2q, F2q, F2e,
	X8e, C3q, C3q, C3q, C3e,
	X8e, C3q, C3q, C3q, C3e,
	X8e, F2q, F2q, F2q, F2e,
	X8e, As2q, As2q, As2q, As2e,
	X8e, F2q, F2q, F2q, F2e, --7
	X8e, C3q, C3q, C3q, C3e,
	X8e, F2q, F2e, F2h,
	X8e, F2q, F2q, F2q, F2e,
	X8e, C3q, C3q, C3q, C3e,
	X8e, C3q, C3q, C3q, C3e,
	X8e, F2q, F2q, F2q, F2e,--page 1
}
song.go()

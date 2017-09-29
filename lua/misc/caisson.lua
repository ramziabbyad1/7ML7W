local song = require 'notation'

song.set_tempo(60)

song.part{
	G4q, E4q, G4h, G4q, E4q, G4h, G4q, E4q, G4q,A4q, G4q, E4q, G4q, E4q, F4q,
	G4q, F4h, D4q, G4q, F4h, D4q, C4h, X8h, G4q, E4q, G4h, G4q, E4q, G4h, G4q, E4q, G4q, 
	A4q, G4q, E4q, G4h, E4q, F4q, G4q, F4h, D4q, G4q, F4h, C4q, B4w, 
}

song.go()

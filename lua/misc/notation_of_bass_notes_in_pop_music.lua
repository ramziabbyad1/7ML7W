local song = require 'notation'

song.set_tempo(220)


song.part{
	G3w, G3w,G3w, G3w,
}
song.part{
	B3w, B3w,B3w, B3w,
}
song.part{
	D4w, D4w,D4w, D4w,
}

song.part{				
	F4w, F4w,F4w, F4w,
}
song.part{				
	X8w, A4w,A4w, A4w,
}

song.part{				
	X8w, X8w, C5w, C5w,
}

song.part{				
	X8w, X8w, X8w, E5w,
}
song.go()

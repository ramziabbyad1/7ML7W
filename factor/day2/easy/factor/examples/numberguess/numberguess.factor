USING: kernel random;
IN: examples.numberguess

SYMBOL: target
: ask-guess ( -- ) "Pick a number between 1 and 100" print ;

: set-random ( guess -- ) 100 random target set ;

: read-guess ( -- guess ) readln string>number ; 

MAIN: program 



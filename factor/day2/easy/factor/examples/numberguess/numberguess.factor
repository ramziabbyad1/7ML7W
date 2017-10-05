USING: prettyprint sequences kernel random io namespaces math math.parser ;
IN: examples.numberguess

: ask-guess ( -- ) "Pick a number between 1 and 100" print ;

: set-random ( -- rand ) 100 random ;

: read-guess ( -- guess ) readln string>number ; 

: compare-guess ( -- ) 
  bi dup print print
  [  > ] [ 
    "Lower" print
  ] [ 
    [ = ] [ 
      "You win!" print 
    ] [ "Higher" print ] if 
  ] if ;
  ! "it was " target get number>string append write 
  ! "you chose " guess get number>string append print ;

MAIN: set-random ask-guess read-guess compare-guess

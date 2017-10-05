USING: io math.parser ;

IN: examples.io-ex-handbk

: ask-age ( -- ) "How old are you?" print ;

: read-age ( -- n ) readln string>number ;

: print-age ( n -- )
    "You are " write
    number>string write
    " years old." print ;
: example ( -- ) ask-age read-age print-age ;

MAIN: example

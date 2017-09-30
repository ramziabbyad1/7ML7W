USING: sequences kernel ;
IN: examples.sequences

: find-first ( seq pred? -- elm )
 filter 0 swap ?nth inline ;

: find-first-2 ( seq pred? -- elm )
 find swap drop inline ; 

 

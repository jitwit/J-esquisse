
strtok =: #~ [: (~:/\ * 0&=) '"'&=
key =: > @: {. @: (<;._1)~ '[ '&(+./ @: (=/))
val =: strtok
pdb =: <;.1~ '[Event'&E.

moves =: I. @: ((LF,'1.')&E.)
moves 100 {:: pdb 1!:1 < 'jingoringo.pgn'
ppgn =: 3 : 0
 j =. moves y
 tagpairs =. (key;val);._2 j {. y
 movetext =. (j }. y) -. LF
 tagpairs ; movetext
)

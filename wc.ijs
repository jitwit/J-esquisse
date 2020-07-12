load 'stats/bonsai'

corpus_file =: 'data/shakespeare.txt'
corpus =: 1!:1 < corpus_file
whitespace=: 9 10 11 12 13 32
lines=: # @: (#;._2)
words=: [: +/ 0 1 E. 0 , whitespace e.~ a.&i.
chars=: #

wc=: lines`words`chars `: 0

NB. find x most frequent words in text y
freq =: 4 : 0
x{.\:~(#;{.)/.~(1 0$~#y)#y=.y<;.1~({.,2~:/\])((39,97+/i.26){a.)e.~y=.tolower y
)

bench=: 3 : 0
echo '"' ,~ 'benching: "', prog=. 'wc 1!:1 < corpus_file'
bonsai prog
)


load 'stats/bonsai viewmat'
corpus_file =: 'data/shakespeare.txt'
sqlite3=: 'data/sqlite3.c'
corpus =: 1!:1 < corpus_file
whitespace=: 9 10 11 12 13 32
lines=: # @: (# ;. _2)
words=: [: +/ 0 1 E. 0 , whitespace e. ~ a.&i.
chars=: #

wc=: lines`words`chars `: 0

NB. find x most frequent words in text y
freq =: 4 : 0
x{.\:~(#;{.)/.~(1 0$~#y)#y=.y<;.1~({.,2~:/\])((39,97+/i.26){a.)e.~y=.tolower y
)

bench=: 3 : 0
echo '"' ,~ 'benching: "', prog=. 'wc 1!:1 < corpus_file'
echo bonsai prog
echo '"' ,~ 'benching: "', prog=. '10 freq 1!:1 < corpus_file'
echo bonsai prog
)

char_class=: a. e. 'abcdefghijklmnopqrstuvwxyz''"'

NB. states: 0         1    2         3      4
NB.         start/end word bracketed quoted spaced endbrack endquote
state_table=: 2 2 2 $ , ". ;. _2 ] 0 : 0
0 0  1 1 NB. outside word
0 3  1 0 NB. inside word
)

parse =: (0;state_table;char_class)&;:

wds=: }: @: (0 1 E. 0 , whitespace e.~ a.&i.)

cwds=: parse tolower corpus

coocc=: ((>./~) * ((*./~) @: *)) @: (+/ @: ((=/) & 'abcdefghijklmnopqrstuvwxyz'))

pairs =: (0&{::) * (coocc@(1&{::))

cooccs=: +/ (pairs @: (#;{.))/.~ cwds
< i. 10 10

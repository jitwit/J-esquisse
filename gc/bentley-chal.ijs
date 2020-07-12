NB. read file of text, find n most frequently used words, print along
NB. with freq.

NB. x wc y : find x most common words in y.
sel=. #~(1 0$~#)
tok=. <;.1~ ({.,2~:/\])@e.&((97+/i.26){a.)
cnt=. (\:~)@((#;{.)/.~)
wc2=: {. cnt@:sel@:tok@:tolower@:]

wc=: 4 : 0
x{.\:~(#;{.)/.~(1 0$~#y)#y=.y<;.1~({.,2~:/\])((97+/i.26){a.)e.~y=.tolower y
)

n=: 40
file=: 'data/NuVoc'
dict=: '../gobble/input/definitions.txt'
prog1=: 'n wc 1!:1 < file'
prog2=: 'n wc2 1!:1 < file'

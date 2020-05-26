NB. flat trie representation
NB. W=: (<@}:;._2) 1!:1 < '../gobble/cobble/share/collins.txt'
start=: (#;~{.@;@{.)/.~{.&>

ws =: W {~ /:~ 10 ?. 1000

compress =: (;~ [: parent 0 {:: ]) @: (0&trie)
NB. x trie y flatten words of y, current depth is x
trie =: 4 : '({."1 ;&; ({:"1)) (x&group /.~ {.&>) y'
group =: 4 : 0
if. 1=#y do. x (] ;~ [+i.@#@;@]) y
else. (x,a) ; (({.>{.y),b) [ 'a b'=.(1+x) trie }. &.> y end.
)
parent=: * * (i:<:@{:)\

NB. trace back word starting at index x in trie y
path=: 4 : 0
'p d w'=. y
n=. x { d
|. w {~ ({&p) ^: (i.>:n) x
)

compress ws
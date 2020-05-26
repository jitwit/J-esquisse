
NB. flat trie representation
NB. W=: (<@}:;._2) 1!:1 < '../gobble/cobble/share/collins.txt'
start=: (#;~{.@;@{.)/.~{.&>

ws =: W {~ /:~ 10 ?. 1000

compress =: 3 : 0
t=. 0 trie y
(parent 0{::t);t
)


NB. x trie y flatten words of y, current depth is x
group =: 4 : 0
l=. {.>{.y
if. 1=#y
do. n=. #;y
    (x+i.n);y
else. 'a b'=.(1+x) trie }. &.> y
      (x,a) ; (l,b)
end.
)

trie =: 4 : 0
if. 1=#y do. (x+i.#>y);y NB. base case, single word
else. segs =. (x&group /.~ {. & >) y
      ds=. ; {."1 segs
      ls=. ; {:"1 segs
      ds ; ls
end.
)

parent=: * * (i:<:@{:)\

path=: 4 : 0
'p d w'=. y
n=. x { d
|. w {~ ({&p) ^: (i.>:n) x
)

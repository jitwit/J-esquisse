NB. flat trie representation
NB. read dictionary
W=: (<@,&'$'@}:;._2) 1!:1 < '../gobble/cobble/share/collins.txt'

NB. compress y - study a list of words y, parent/depth/flattened chars
compress =: (;~ [: parent 0 {:: ]) @: (0&trie)

NB. tri and group mutually & recursively partition words by first char
NB. then flatten keeping tracck of depths. todo keep track of accepts
NB. x trie y - flatten list of words y, at current depth x
trie =: 4 : 0
  ({."1 ;&; ({:"1)) (x& grp /.~ {.&>) y
)
grpb=: 4 : 0
  y;~x+i.#;y
)
grpi=: 4 : 0
  'a b'=.(1+x)trie}.&.>y
  (x,a);(({.>{.y),b)
)

grp =: grpi`grpb@.(1=#@]) f.
parent=: * * (i:<:@{:)\

NB. better performing version of parent from A. Hsu thesis
parentk=: 3 : 0
ps=. 0 #~ n =. # y
for_ab. 2 ]\ (i.n) </.~ y do. 'x y' =. ab
  ps=. ((<: x I. y) { x) y} ps
end. ps
)

NB. x path y - trace back word starting at index x in trie y
path=: 4 : 'w {~ ({&p) ^: (i.->:x{d) x[''p d w''=. y'

NB. 'x0 x1' CD y - char x0 at depth x1 in trie y
CD=: 4 : '((1{::x)=1{::y)*((0{::x)=2{::y)'

lexicon=: /:~ ;: 'car cars cat cats do dog dogs done ear ears eat eats'
NB. take depth vector and get 2d array
spread=: (=/~ (i.@:>:@:(>./)))

NB. lca/index in prefix of nodes x in flat trie y
lca=: path"0 _/

NB. pretty print based on depth vector
pretty_print=: 3 : 0
'p d c'=. compress y
wid=: >./ d
pad=: (wid,#d) $ ' '
|: d |."0 1 |: pad , c
)

anns=: ;: 'ana ann anna anne'

pretty_print lexicon
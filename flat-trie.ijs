NB. flat trie representation
NB. read dictionary
NB. W=: (<@}:;._2) 1!:1 < '../gobble/cobble/share/collins.txt'

NB. compress y - study a list of words y, depth/parent vectors/flattened chars
NB. x trie y - flatten list of words y, at current depth x
NB. x path y - trace back word starting at index x in trie y
NB. tri and group mutually & recursively partition words by first char
NB. then flatten keeping tracck of depths.

compress =: (;~ [: parent 0 {:: ]) @: (0&trie)
trie =: 4 : '({."1 ;&; ({:"1)) (x& grp /.~ {.&>) y'
grpb=: ];~[+i.@#@;@]
grpi=: 4 : '(x,a);(({.>{.y),b)[''a b''=.(1+x)trie}.&.>y'
grp =: grpi`grpb@.(1=#@]) f.
parent=: * * (i:<:@{:)\
path=: 4 : 'w {~ ({&p) ^: (i.->:x{d) x[''p d w''=. y'

NB. 'x0 x1' CD y - char x0 at depth x1 in trie y
CD=: 4 : '((1{::x)=1{::y)*((0{::x)=2{::y)'
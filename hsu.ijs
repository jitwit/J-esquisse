NB. notes from Aaron Hsu's thesis:
NB. https://scholarworks.iu.edu/dspace/handle/2022/24749

NB. represent AST as inverted table
NB. symbols are interned at parsing phase to further use small ints
NB. column name desc
NB. 0      p    parent vector
NB. 1      t    type of node
NB. 2      k    subclass or kind
NB. 3      n    Name or Reference -- interned negative symbol ref or parent ref
NB. 4      i    node id (i. # tree)

NB. convert depth vector => parent vector
P =: 3 : 0
ps=. 0 #~ n =. # y
for_lk. 2 ]\ (i.n) </.~ y
do. ps=. ps k }~ l {~ <: l I. k [ 'l k' =. lk
end. ps + (i. n) * 0 = y
)


NB. lexical scope
I =: {~ NB. I←{(⊂⍵)⌷⍺}, which is dfns and squad similar to like j's index
egp1 =: 0 0 1 2 0 4 5 5 7 0 9 10 11 12 13 12 12 16 10 18 19 20 19 19 23 10 25
egt1 =: 3 1 0 7 1 2 9 0 10 1 3 1 2 0 10 9 0 10 1 2 0 10 9 0 10 0 10

NB. self index for nodes that are not functions (type 3)
B=: 1 : '(3~:y{u)}(,:I)y'
NB. x is type vector, y is parent vector
lexical_contour =: 4 : 'x B^:_ y'


NB. function lifting
egd2 =: 0 1 2 3 4 5 4 5 6 7 6 6 7 4 5 6 5 6 7 8 7 7 8 5 6 7 6 7 8 9 8 8 9 6 7
egp2 =: P egd2
egt2 =: 3 1 3 2 0 10 3 2 0 10 9 0 10 2 0 10 3 2 0 10 9 0 10 2 0 10 3 2 0 10 9 0 10 0 10


NB. find functions who aren't roots to push out:
NB. i←⍸(t=3)∧p≠⍳≢p
NB. i=. I. (3 = egt2) * (~: i.@#) egp2

NB. give ids to function references at end
NB. p,←n[i]←(≢p)+⍳≢i
NB. p =. (((#p) + (i.@#) i) i} p), i
NB. other updates:
NB. t =. t , (i.#i) $ 3 NB. allocated nodes are function nodes
NB. k =. t , (i.#i) $ 1 NB. whose kind is 1
NB. n =. t , (i.#i) $ 0 NB. whose _?? is 0
NB. r =. r , i
NB. also:
NB. t =. 10 i} t  NB. now variable type
NB. k =. 1 i} k   NB. now kind 1

NB. how to express this in J?
NB. t k n r,←3 1 0(r[i])⍴⍨ ̈≢i


NB. use spread to convert boxed J trees to something with depth
NB. vectors? something like (# S:1 {:: y)
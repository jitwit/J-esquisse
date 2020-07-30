]lexicon=: ,&'$' &.> /:~ ;: 'car cars cat cats do dog dogs done ear ears eat eats'

by_head =: (({.@:;) ; <)/.~ {.@>
nonempty=: a: -.~ ]

NB. skeleton, on the tright track 
trie0=: 3 : 0
  if. a: = y do. '';'' else.
  grps =. by_head y
  edges =. > {."1 grps
  subtries =. (trie0 @: (}.&.>)) &.> {:"1 grps

  edges ; subtries
  end.
)

trie=: 3 : 0
  y =. y -. a: NB. drop empty suffixes
  if. a: = y do. ('';'';'') else.
  grps =. by_head y
  edges =. > {."1 grps
  subtries =. (trie @: (}.&.>)) &.> {:"1 grps
  tp =. # edges
  hp =. 0
  tptrs =. hptrs =. ''
  chrs  =. edges
  deps  =. tp#0
  for_t. subtries do.
    'ds is cs' =. , > t
    NB. nonempty suffix
    if. #is do.
      chrs =. chrs , cs          NB. include chars
      hptrs =. hptrs , tp        NB. point to block
      tptrs =. tptrs , tp + is   NB. include and update pointers in block
      tp =. tp + # is            NB. update tail pointer
      hp =. 1 + hp               NB. update head pointer
      deps =. deps , 1 + ds
    NB. empty suffix below, point current head char to self and update head pointer
    else. hp =. 1 + hp [ hptrs =. hptrs , hp end.
  end. deps;(hptrs,tptrs) ; chrs end.
)

NB. block should be determinable from pointers
NB. let i,j be indices
NB. if i+1 = j, p[i] > p[j] => j in subtrie/i is end of head block
NB. if ptr[i] = i+1, head block is of size 1
NB. else can keep scanning?
NB. have index x pointing to "head" block
NB. maybe following is easier if wasteful:
match_char=: 4 : 0
'j c' =. x
if. j < 0 do. _1 return. end.
'deps ptrs chrs' =. y
n =. # deps
k =. j + c i.~ (j+i. (27 <. n - j)) { chrs
if. k >: n do. _1 return. end.
if. =/ (j,k) { deps do. k { ptrs return. end.
_1
)

match_prefix=: 4 : 0
ix=. 0
for_c. x
do. ix=. (ix;c) match_char y
end. ix
)


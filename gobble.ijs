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
  if. a: = y do. ('';'') else.
  grps =. by_head y
  edges =. > {."1 grps
  subtries =. (trie @: (}.&.>)) &.> {:"1 grps
  tp =. # edges
  hp =. 0
  tptrs =. hptrs =. ''
  chrs  =. edges
  for_t. subtries do.
    'is cs' =. , > t
    NB. nonempty suffix
    if. #is do.
      chrs =. chrs , cs          NB. include chars
      hptrs =. hptrs , tp        NB. point to block
      tptrs =. tptrs , tp + is   NB. include and update pointers in block
      tp =. tp + # is            NB. update tail pointer
      hp =. 1 + hp               NB. update head pointer
    NB. empty suffix below, point current head char to self and update head pointer
    else. hp =. 1 + hp [ hptrs =. hptrs , hp end.
  end.
  (hptrs,tptrs) ; chrs
  end.
)

'ptrs chrs' =: trie lexicon
,. ((,:~ i.@#) ptrs);chrs
NB. trie lexicon
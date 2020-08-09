start =: |:@,:@i.
adj =: [: ,/ i.@[ ,"0 1/ ]
attack =: {. e. [: , }. (+"1) _1 0 1 */ i.&.<:@#
grow =: (#~ 1 - attack"1) @: adj
queens=: 3 : 'y & grow ^: (y-1) start y'
board =: - |."0 1 'q' ,. ' ' $~ (, <:) @ #

queensfor=: 3 : 0
 z=.i.n,*n=.y
 for. }.z do.
  b=. -. (i.n) e."1 ,. z +"1 _ ((-i.){:$z) */ _1 0 1
  z=. ((+/"1 b)#z),.n|I.,b
 end.
)
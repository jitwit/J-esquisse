start =: |:@,:@i.
adj =: [: ,/ i.@[ ,"0 1/ ]
attack =: {. e. [: , }. (+"1) _1 0 1 */ i.&.<:@#
grow =: (#~ 1 - attack"1) @: adj
queens=: 3 : 'y & grow ^: (y-1) start y'
board =: - |."0 1 'q' ,. ' ' $~ (, <:) @ #
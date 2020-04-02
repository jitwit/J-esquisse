]'N A B'=: <;._2 rosalind'seto'
NB. example''
parse=: [: ". [: > ({~ 1+2*i.@<.@-:@#) @: ;:
unparse=: ' '-.~'}',~'{',[:}.[:,(',',":)"0

U=. 1+i.".N

ops=: (~.@,)`([#~e.)`-.`(-.~)`(U-.[)`(U-.]) `: 0

join=: <@-.&0"1 @ ops & parse

>unparse &.> A join B

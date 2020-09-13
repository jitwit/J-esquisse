perms=: [: ":"0 [: ~. i.@!@# A. ]
ops=: '+-*%'
opcs=: ,:"0 ' ',.,/ops,"0 1/,/,"0/~ops
comb=: [: ,/,"1
exps=: ' ' -.~"1 [: ,/ opcs comb"2 2/ perms
solve=: (#~ 24 = ".) @ exps


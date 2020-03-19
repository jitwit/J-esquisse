comb=: [: , (' ',[) ,. ]

combp=: dyad define
'f g h'=. x
'a b c d'=. y
(a,f,'(',b,g,c,')',h,d),('((',a,f,b,')',g,c,')',h,d),('(',a,f,b,g,c,')',h,d),:'(',a,f,b,')',g,c,h,d
)

NB. good one with ^ is math24 2 4 3 3
ops=: '+-*%' NB. ,'^'
opcs=: > , { 3#<ops
perms=: [: ":"0 [: ~. i.@!@# A. ]
exps=: ' ' -.~"1 [: ,/ opcs comb"1 2/ perms
expsp=: ' ' -.~"1 [: ,/ [: ,/ opcs combp"1 2/ perms
build=: 1 : '(#~ 24 = ".) @: u'

math24=: monad define
es=. exps build y
if. 0 = #es do. expsp build y else. es end.
)

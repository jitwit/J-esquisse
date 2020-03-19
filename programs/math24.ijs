comb=: [: , (' ',[) ,. ]

combp=: dyad define
'a b c d'=. y['f g h'=. x
(a,f,'(',b,g,c,')',h,d),('((',a,f,b,')',g,c,')',h,d),('(',a,f,b,g,c,')',h,d),:'(',a,f,b,')',g,c,h,d
)

ops=: > , { 3#<'+-*%'
perms=: [: ":"0 [: ~. i.@!@# A. ]
build=: 1 : '(#~ 24 = ".) @: u'

math24=: monad define NB. prefer expressions without parens & fallback if needed
assert. 4 = # y
es=. ([: ,/ ops comb"1 2/ perms) build y
if. 0 = #es do. es =. ([: ,/ [: ,/ ops combp"1 2/ perms) build y end.
es -."1 ' '
)

run=: monad define
prob=: /:~ 1 + ? 4 $ 13
sols=: math24 prob
prob
)

NB. solutions

NB. number of permutation of k things from n things
P=: !@[*!

NB. given random mating in pop with makeup k dd, m dr, n rr, how many
NB. offspring dominant trait?
mendell1=: monad define
'k m n'=. y
-. ((*<:)+/y) %~ ((*<:)n) + (n*m) + 1r4*(*<:)m
)

NB. answers
]partial_perms=: 1000000|P~/,".;._2 rosalind 'pper'
]prob_dom     =: 10j8":mendel1,".;._2 rosalind 'iprb'
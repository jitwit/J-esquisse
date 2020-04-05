NB. solutions

NB. number of permutation of k things from n things
perms=: i.@!A.i.
P=: !@[*!
SUBS=: 2&(1000000&|@^)
PRM=: [:*/[:!1x*[:+/=/&'AG' NB. perfect matchings base pairs

fmtsgn=: (' -',":@])`('  ',":@])@.(0=[)
sgns=: [:#:i.@(2&^)


NB. given random mating in pop with makeup k dd, m dr, n rr, how many
NB. offspring dominant trait?
mendell1=: monad define
'k m n'=. y
-. ((*<:)+/y) %~ ((*<:)n) + (n*m) + 1r4*(*<:)m
)

NB. answers
NB. 1000000|P~/,".;._2 rosalind 'pper'
NB. 10j8":mendel1,".;._2 rosalind 'iprb'
NB. s=: >{:,fasta rosalind'pmch'
NB. ({.@,-#)".'m'freads<'data/rosalind_tree.txt'
NB. >(;~ ":@#)([:, fmtsgn"0/) &.> ,/> &.> { <"1&.> (sgns;1+perms) 2


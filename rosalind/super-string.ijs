
'A B C D'=.{:"1 fasta example''
NB. 'T1 S1'=. {:"1 fasta rosalind'sseq'NB.example''
dna=: {:"1 fasta rosalind'long'
eg=: {:"1 fasta example''

lix=: <. & #
joins=: [ ,"_ 1 ]\.@]
match=: [: {: [: I. [: +/"1 ] E."1 joins
nid=: (-.@=@:i.@#)
matchrix=: >@:(match &. >)"0/~
mat=: -:@#@> <:"1 _ nid * matchrix

combine=: ([ , match }. ]) &. >

super=: {. combine"1 }.

start=: [:{.[:I.0=+/
next=: [: {. [: I. {

solve=: monad define
echo M=. mat y
n=. # M
x0=. start M
perm=. next&M ^: (i.n) x0
outputs >combine/ perm { y
)
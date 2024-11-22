D =: (CR-.~]);._2 ] 1!:1 < 'data/collins.txt'

w4 =. 4 <: [: +/ AZ e. ] NB. at least 4 letters (slow)
ss =. [: *./ e.~         NB. subset of available letters
hf =. {.@[ e. ]          NB. contains central letter
P =: w4 *. ss *. hf      NB. predicate
Bee =: ] #~ P"1          NB. solve a spelling bee puzzle

X =: 'BAICKLT '
X Bee D

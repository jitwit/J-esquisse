D =: (CR-.~]);._2 ] 1!:1 < 'data/collins.txt'

NB. x is spelling bee word bank with central/required letter at head.
P =: (4 <: [: +/ AZ e. ]) *. ([: *./ e.~) *. {.@[ e. ]
B =: ] #~ P"1

X =: 'BAICKLT '
X B D

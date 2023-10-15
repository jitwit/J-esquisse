NB. what puzzle difficulty is highest?
load 'plot'
R3 =: ". ;. _2 ] 1!:1 <'data/rush3.txt'
R5 =: ". ;. _2 ] 1!:1 <'data/rush5.txt'
PB =: ". ;. _2 ] 1!:1 <'data/battle.txt'
NZ =: (# - (+/)) @: (0 = <./)
L =: <./ NZ &> PB;R3;R5
A =: L {. (+/%#)
pd'reset; visible 0'
pd A R3
pd A PB
pd A R5
pd 
pd 'key "3 min rush" "puzzle battle" "5 min rush"'
pd 'show'



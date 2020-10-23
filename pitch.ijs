NB. 20th century music, 12 tone pitch class normal form, basically
NB. among all orderings of a set of notes, it is the "most compact"
NB. meaning the distance from the bottom and top notes is minimal and
NB. ties are broken by smallest intervals at bottom.
require 'stats/base'
coclass 'twelvetone'

O =: /:~ @: ~.                      NB. organize
R =: # (12 | ] - {.)\ ],}:          NB. all rotations, translated to start with 0
H =: (/: ({:-{.)"1) @: /:~          NB. sort based on smallest width & lexicographic
PF =: {. @: H @: R @: O             NB. normal/prime form, excluding flipping
				    
U =: ([:,</~@i.@#) # ,              NB. select upper triangle
T =: [: <:@:#/.~ (1+i.6)&,          NB. count [1..6]
IV =: T @: U @: (6&-@|@(6&-)@-@-/~) NB. interval vector

IV 0 2
IV 0 5
IV 0 1 3
IV 0 1 3 5
IV 0 4 5
IV 0 3 7
IV 0 1 4 6
IV 0 1 3 7

primeform_z_ =: PF_twelvetone_
intervals_z_ =: IV_twelvetone_

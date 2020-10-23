NB. 20th century music, 12 tone pitch class normal form, basically
NB. among all orderings of a set of notes, it is the "most compact"
NB. meaning the distance from the bottom and top notes is minimal and
NB. ties are broken by smallest intervals at bottom.
require 'stats/base'
coclass 'twelvetone'

O =: /:~ @: ~.                    NB. organize
R =: # (12 | ] - {.)\ ],}:        NB. all rotations, translated to start with 0
H =: (/: ({:-{.)"1) @: /:~        NB. sort based on smallest width & lexicographic
C =: {. @: H @: R @: O            NB. normal/prime form, excluding flipping

NB. interval vector
IV =: [: (-:@<:@#/.~) (i.6),0-.~,@:|@:(-/~)
NB. list them all out
,. (([: <@H@~. C@I."1)/.~ (+/"1)) #: i. 2 ^ 12

FLIP =: {. @: H @: ,&(R@O) 12 | 12&- NB. normal/prime form, including
				     NB. flipping, which is kind of
				     NB. ridiculous becuase major
				     NB. triad ~ minor triad here...

primeform_z_ =: C_twelvetone_
IV_z_ =: IV_twelvetone_

C 0 3 5
IV 0 3 5

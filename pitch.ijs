NB. 20th century music, 12 tone pitch class normal form, basically
NB. among all orderings of a set of notes, it is the "most compact"
NB. meaning the distance from the bottom and top notes is minimal and
NB. ties are broken by smallest intervals at bottom.

O =: /:~ @: ~.                    NB. organize
R =: # (12 | ] - {.)\ ],}:        NB. rotations, after nubbing and sorting
H =: (/: ({:-{.)"1) @: /:~        NB. sort based on smallest width & lexicographic
F =: {. @: H @: ,&(R@O) 12 | 12&- NB. normal/prime form, including flipping
C =: {. @: H @: R @: O            NB. normal/prime form, excluding flipping

C 2 3 7 11

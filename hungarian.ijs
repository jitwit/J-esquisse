M0 =: ".(;._2) 0 : 0
250 400 350
400 600 350
200 400 250
)

M1 =: ".(;._2) 0 : 0
90 75 75 80
35 85 55 65
125 95 90 105
45 110 95 115
)

NB. almost there, but hard part, which is unclear in wiki article and
NB. much of the stack overflow bs is finding _zero-term rank_(!), the
NB. minimal number of lines required to cover 0s.

R =: - <./"1
C =: R &. |:
Z =: C@R
(; Z) M1

M =: 4 : 0
NB. x is boxed list of row mask and col mask, y is matrix
NB. find min element not in mask, and reweight
assert. (#y) > +/#&>x
'r c'=. x [ js=. ($$i.@#) y
rm=. |: js e. r [ cm=. js e. c
a =. <./ 0 -.~ , (-. rm) * y * -. cm
(a * cm) + y - a * -. rm
)

NB. adj list from matrix 0s
BG =: [: (([: < {:"1)/.~ {."1) 4 $. $. @ (0&=)

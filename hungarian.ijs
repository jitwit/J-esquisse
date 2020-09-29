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

TG =: 3 : 0
G =. 0 $~ ,~ +: n =. #y
E =. ; (,.&.>/)"1 (<"0 i.n) ,. n&+ &.> BG y
(- |:) 1 (<"1 E)} G
)

cap =: 3 : 0
NB. take weights, find capacities for setting up a flow network based
NB. on 0s
v =. >: +: n =. # y
c =. (0,n) (<@:>:@:+"1) 4 $. $. 0 = y
s =. (<"1) 0 ,. 1 + i. n
t =. <"1 v ,.~ n + 1 + i. n
1 (c,s,t)} (,~ +: >: n) $ 0
)

bfs =: 3 : 0
NB. bfs from sink to source on risidual graph, calculate path
Q =. ,0
S =. 0,(<:#y)$1 NB. v explored iff 0 = v{S
T =. i.#y NB. bfs parent tree, initially all point to self
while. #Q do.
  'u Q' =. ({.;}.) Q NB. pop Q
  for_v. I. S * u{y do. NB. unexplored out edges u -> v
    Q =. v ,~ Q NB. push v
    S =. 0 v} S NB. mark v explored
    T =. u v} T NB. indicate parent in tree T
  end.
end. ({&T) ^: a: <:#y
)

res =: 4 : 0
NB. compute residual graph from capacity y and flow x
y - |: x NB. ?
)

edmond_karp =: 3 : 0
F =. 0 $~ $ G =. cap y
F res G
)

edmond_karp Z M1


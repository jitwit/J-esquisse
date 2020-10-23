mat=: ".;._2 (1!:1) < jpath '~/code/euler/J/345.in'
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

bfs =: 4 : 0
NB. get tree from bfs starting at x in graph y
Q =. ~.,x NB. seed queue from x and mark x explored
S =. -. (T =. i.#y) e. x NB. explored v iff 0 = v{S
while. #Q do. 'u Q' =. ({.;}.) Q NB. pop Q
  vs =. I. S * u{y NB. unexplored out edges u -> v
  Q =. vs ,~ Q NB. push vs
  S =. 0 vs} S NB. mark vs explored
  T =. u vs} T NB. indicate parent in tree T
end. T
)

res =: 4 : 0
NB. compute residual graph from capacity y and flow x
y - x NB. 0 = +/ ((j,i) ; i,j) { flow
)

delta =: 4 : 0
NB. change in flow x, cap y
sink =. <:#y
R =. x res y
T =. 0 bfs R
if. sink = sink { T do. x return. end.
P =. 2 <\ |. {&T ^: a: sink
df =. <./ | P { R
x + (- |:) df P} ($x) $ 0
)

edmond_karp =: 3 : 0
f =. 0 $~ $ g =. y
delta&g ^: _ f
)

match =: 3 : 0
(0,_1-#y) (+"1) 4 $. $. }:"1 }. 1 = edmond_karp cap y
)

cover =: 4 : 0
NB. x is match, y is graph
x+y
)

  
NB. > <"1 match Z mat
NB. (4;0 1 3) M (0 4;1 3) M (0 1 4;1) M Z mat


con =: 3 : 0
e =. (0,n=.#y) (<@:+"1) 4 $. $. 0 = y
1 e} (,~ +: n) $ 0

)
clo =: +. (+./ . *.)~


hungarian =: 3 : 0
n =. # y
g =. clo^:_ (+. |:) con y
U =. (i.n) -. {."1 m =. match y
g ; m ; U
)

match Z mat

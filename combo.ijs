NB. a combinations function based on gosper bit hack:
NB. unsigned arithmetic, next number with equal popcount is
NB. I next (I a) {
NB.   c <- a & -a
NB.   r <- a + c
NB.   R (((r^a) >> 2) / c) | r;
NB. }
next=: 3 : 0
c=. y 17 b. - y
(c + y) 23 b. <. c %~ _2 (33 b.) y 22 b. c + y
)

NB. subsets of size x out of possible y
subsets =: 4 : 0
k =. x ! y
#: next ^: (i. - k) <: x 33 b. 1
)

NB. much better version from J wiki / stats addon
combbool=: 4 : 0
k=. <"1 (-i.1+d=.y-x)|."0 1 y{.1
z=. (d$<(0,y)$0),<,:y#0
for. i.x do. z=. k (+."1)&.> ,&.>/\. (_1&|."1)&.> z end.
; z
)
load 'plot'
Q =: 10 ^ %&400
E =: Q@[ % +&Q
d =: 5
R =: {{ d * y - (800%^.10) * ^. (x +&Q y) }}
NB. change in rating per game of equally rated players
dR =: d * _1 + 2*0&E
ok =: 2*d
I =: 0:`(]+dR)@.(>&ok)
R =: _2 + # @: (I^:a:)

NB. u G y, simulated rating change of playing of strength u playing at rating y.
G =: {{ y + ((,-)d){~(?0) >: u E y }}

NB. simulating true rating progression
S =: {{ (0 G) ^: (i. y) 0 }}
NB. simulating how many games to reach true strength from starting rating
S0 =: 3 : 0
n=.0
r=.y
while. 0>r=.0 G r do. n=.>:n end. n
)

NB. estimating average expected max rating devation from true strength
NB. over y games over x samples.
A =: {{ (+/%#) >./ | |: S"0] x # y }}
NB. estimating average expected games to reach true strength from
NB. rating y over x samples
A0 =: {{ (+/%#) S0"0] x # y }}

NB. 'dot' plot (; R"0) ] 10 * i. 100

NB. plot a rating progression over y games
PR =: 3 : 0
pd 'reset; xcaption games; ycaption rating vs true strength'
pd S y
pd 'visible 0; show'
)
NB. PR 2000

NB. 'dot' plot 1000 A0"0 ] _25 * i. 14
NB. 'dot' plot R"0 ] 25 * i. 14
1000 A0 _100
1000 A0 _200

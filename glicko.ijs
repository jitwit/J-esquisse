load 'plot'
coclass 'glicko'

NB. constant related to how long it takes to go back to provisional
NB. rating.
t =: 1 NB. time (units are number of rating periods)
c =: 350 (100 %~ -) &.: *: 50 NB. ...

q =: 400 %~ ^. 10 NB. scaling constant
NB. G y -- y is rating deviation. G(RD)
G =: 1 % (1+*&(3p_2**:q)) &.: *: NB. to damp expectations according to
				 NB. rating devation

NB. x E y -- player of rating x's expected score against opponent of
NB. rating {.y and rating devation {:y. basically just ELO model,
NB. damped for uncertainty of opponent rating by G.
RDj =: {:@:]
Rj =: {.@:]
E =: 1 % 1 + 10 ^ _400 %~ (G@:RDj) * ([-Rj)

D2 =: 1 % (*:q) * [: +/ (*:@:G@:RDj"1) * (*-.) @: (E"1)

1500 D2 _2 ]\ 1400 30 1550 100 1700 300

tests =: 0 : 0
1e_6 > | 0.995498 - G 30
1e_6 > | 0.953149 - G 100
1e_6 > | 0.724235 - G 300
1e_6 > | 0.639468 - 1500 E 1400 30
1e_6 > | 0.431842 - 1500 E 1550 100
1e_6 > | 0.302841 - 1500 E 1700 300
)

0!:2 tests

NB. 'visible 0' plot (;g) 0.1*i.1000
NB. step 1. ie, calculate new ratings deviation. m is time. y is old
NB. RD
RD =: {{350 <. %: (*:y) + m**:c}}

100 RD 40

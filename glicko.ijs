load 'plot'
coclass 'glicko'

NB. constant related to how long it takes to go back to provisional
NB. rating.
t =: 1 NB. time (units are number of rating periods)
c =: 350 (100 %~ -) &.: *: 50 NB. ...

q =: 400 %~ ^. 10 NB. scaling constant

NB. G y -- y is rating deviation. G(RD), it comes from approximating
NB. integration over the prior distribution of ratings given rating
NB. deviation
G =: 1 % (1+*&(3p_2**:q)) &.: *:

RD =: 1&({"1)
R =: 0&({"1)
S =: 2&({"1)

NB. x E y -- player of rating x's expected score against opponent of
NB. rating+RD y. basically ELO model, accounting for uncertainty of
NB. opponent rating via G
E =: 1 % 1 + 10 ^ _400 %~ (G@:RD@:]) * (-&R)
D =: [: %: 1 % (*:q) * [: +/ (*:@:G@:RD@:]) * (*-.) @: E
rd =: (RD@:[) (1 % +&%&*:) D NB. 1/(1/RD^2 + 1/d^2)
NB. change in RD
dRD =: [: %: rd
NB. change in mean
dR =: R@:[ + q * rd * [: +/ (G@:RD@:]) * (S@:]) - E
NB. change in glicko rating
dG =: dR,dRD

tests =: 0 : 0
1e_2 > | 0.995498 - G 30
1e_2 > | 0.953149 - G 100
1e_2 > | 0.724235 - G 300
1e_2 > | 0.639468 - 1500 E 1400 30 1
1e_2 > | 0.431842 - 1500 E 1550 100 0
1e_2 > | 0.302841 - 1500 E 1700 300 0
1e_2 > | +/ 1464.11 151.4 - 1500 200 dG _3 ]\ 1400 30 1 1550 100 0 1700 300 0
)

0!:2 tests

load 'plot'
coclass 'glicko'

NB. glicko 1 rating system
NB. http://www.glicko.net/glicko/glicko.pdf
NB. http://www.glicko.net/research/glicko.pdf

NB. constant
q =: 400 %~ ^. 10

NB. G y -- y is rating deviation. G(RD), it comes from approximating
NB. integration over the prior distribution of ratings given rating
NB. deviation
G =: 1 % (1+*&(3p_2**:q)) &.: *:

NB. some "abstraction"
RD =: 1&({"1)
R =: 0&({"1)
S =: 2&({"1)

NB. x EG y -- player of rating x's expected score against opponent of
NB. rating+RD y. basically ELO model, accounting for uncertainty of
NB. opponent rating via G
EG =: 1 % 1 + 10 ^ _1r400 * (G@:RD@:]) * (-&R)
D =: [: %: 1 % (*:q) * [: +/ (*:@:G@:RD@:]) * (*-.) @: EG
rd =: (RD@:[) (1 % +&%&*:) D NB. 1/(1/RD^2 + 1/d^2)
NB. change in RD
dRD =: [: %: rd
NB. change in mean
dR =: R@:[ + q * rd * [: +/ (G@:RD@:]) * (S@:]) - EG
NB. change in glicko rating
dG =: dR,dRD

NB. expected outcome of game according to ratings + deviations of two
NB. players
E =: 1 % 1 + 10 ^ _1r400 * ([: G (+&.:*:)&RD) * (-&R)

tests =: 0 : 0
1e_2 > | 0.995498 - G 30
1e_2 > | 0.953149 - G 100
1e_2 > | 0.724235 - G 300
1e_2 > | 0.639468 - 1500 EG 1400 30 1
1e_2 > | 0.431842 - 1500 EG 1550 100 0
1e_2 > | 0.302841 - 1500 EG 1700 300 0
1e_2 > | +/ 1464.11 151.4 - 1500 200 dG _3 ]\ 1400 30 1 1550 100 0 1700 300 0
1e_2 > | 0.376 - 1400 80 E 1500 150
)

0!:2 tests

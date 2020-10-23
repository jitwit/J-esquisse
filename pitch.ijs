NB. why am i brushing up on some of the most boring music theory?
NB. dunno. well, actually it's because i remember how fuzzy the
NB. procedures for normal forms and other concepts were and J is great
NB. for writing concise and precise definitions. perhaps this will
NB. bring some clarity.
require 'stats/base'
coclass 'twelvetone'

Z12 =: i.12                               NB. Z/12Z
SC =: /:~ @: ~.                           NB. set class, ie order and nub
NR =: # ]\ ],}:                           NB. normal all rotations
PR =: # ([: /:~ 12 | ]-{.)\ ],}:          NB. prime all rotations
I =: 12 | -                               NB. invert in Z/12Z
NH =: (/:(12|{:-{.)"1) @: (/:(12|]-{.)"1) NB. normal grade by "compactness"
PH =: (/:(12|{:-{.)"1) @: /:~             NB. prime grade by "compactness"
NF =: {. @: NH @: NR @: SC                NB. normal form
PF =: {. @: PH @: (,&PR I) @: SC          NB. prime form
UPCI =: {{6-|6---/~y}}                    NB. unordered pitch class intervals
U =: #&,~ </~@i.@#                        NB. select upper triangle
T =: [: <:@:#/.~ (1+i.6)&,                NB. count [1..6]
IV =: T @: U @: UPCI                      NB. interval vector

NB. alternate interval vector calculation based on looking at
NB. fixpoints under transposition
CTT =: (+/@e."1) 12 | Z12&(+/)
IVT =: 1 1 1 1 1 1r2 * [: |. _6 {. CTT

major =: 0 2 4 5 7 9 11
minor =: 0 2 3 5 7 9 10
minorh =: 0 2 3 5 7 8 11
minormu =: 0 2 3 5 7 9 11
minormd =: 0 2 3 5 7 8 10
wholetone =: +: i. 6

primeform_z_ =: PF_twelvetone_
intervals_z_ =: IV_twelvetone_

assertions =: 0 : 0
0 0 0 0 0 0 -: IV 11
0 1 0 0 0 0 -: IV 0 2
0 0 0 0 1 0 -: IV 0 5
1 1 1 0 0 0 -: IV 0 1 3
0 0 1 1 1 0 -: IV 0 3 7
0 0 1 1 1 0 -: IV 0 4 7
1 1 1 1 1 1 -: IV 0 1 4 6
1 1 1 1 1 1 -: IV 0 1 3 7
2 5 4 3 6 1 -: IV major
(,8) -: NF 8
(,0) -: PF 8
8 9 11 0 4 -: NF 0 4 8 9 11
0 1 2 6 -: PF 1 5 6 7
12 = # ~. (PF"1) 3 comb 12 NB. there are 12 trichords
29 = # ~. (PF"1) 4 comb 12 NB. there are 29 tetrachords
(IV -: IVT) major
)

0!:2 assertions
load 'stats/bonsai'

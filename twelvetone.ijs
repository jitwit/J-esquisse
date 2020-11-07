NB. why am i brushing up on some of the most boring music theory?
NB. dunno. well, actually it's because i remember how fuzzy the
NB. procedures for normal forms and other concepts were and J is great
NB. for writing concise and precise definitions. perhaps this will
NB. bring some clarity.

require 'stats/base'
coclass 'twelvetone'

NB. intro post-tonal theory Joseph N. Straus, collected definitions
NB. and concepts.
Z12 =: i.12                                NB. Z/12Z
SC =: /:~ @: ~.                            NB. set class, ie order and nub
NR =: # ]\ ],}:                            NB. normal all rotations
PR =: # ([: /:~ 12 | ]-{.)\ ],}:           NB. prime all rotations
T12 =: 12 | +                              NB. translate in Z/12Z
I12 =: 12 | -                              NB. invert in Z/12Z
NH =: (/:(12|{:-{.)"1) @: (/:(12|]-{.)"1)  NB. normal grade by "compactness"
PH =: (/:(12|{:-{.)"1) @: /:~              NB. prime grade by "compactness"
NF =: {. @: NH @: NR @: SC                 NB. normal form
PF =: {. @: PH @: (,&PR I12) @: SC         NB. prime form
U =: #&,~ </~@i.@#                         NB. select upper triangle
CNT =: {{ <:@#/.~ u,y }}                   NB. count occs of u in y
IV =: (1+i.6) CNT @: U @: {{6-|6+-/~y}}    NB. interval vector
IXV =: [: Z12 CNT [: , 12 | (+/~)          NB. index vector
ORBT =: [: ~. [: (/:~"1) 12 | Z12&(+/)     NB. orbit under Z12 and T
ORBI =: [: ~. [: (/:~"1) 12 | Z12 +/ I12   NB. orbit under Z12 and T*I
ORB =: [: ~. ORBT , ORBI                   NB. orbit under dihedral 24
DSYM =: 12 % ORBT (,&#) ORBI               NB. degrees of symmetry
EQV =: e. ORB                              NB. equivalent/symmetric by D24
NB. same interval content but not same equiv class under action by D24
ZREL =: -:&IV *. -.@EQV                    NB. z related
NEG =: Z12&-.                              NB. complement
CREL =: (-:&PF) NEG                        NB. self complement (hexachords only)
PCOM =: {{(12%#o) * (NEG y) e. o=.ORBT y}} NB. p-combinatorial
ICOM =: {{(12%#o) * (NEG y) e. o=.ORBI y}} NB. i-combinatorial
RCOM =: {{(12%#o) * y e. o=.ORBT y}}       NB. r-combinatorial
RICOM =: {{(12%#o) * y e. o=.ORBI y}}      NB. ri-combinatorial
COM =: PCOM,RCOM,ICOM,RICOM

NB. alternate interval vector calculation based on looking at
NB. fixpoints under transposition
CTT =: (+/@e."1) 12 | Z12&(+/)
IVT =: [: <. 1 1 1 1 1 0.5 * [: |. _6 {. CTT

NB. some scales
major =: 0 2 4 5 7 9 11
minor =: 0 2 3 5 7 8 10
minorh =: 0 2 3 5 7 8 11
minormu =: 0 2 3 5 7 9 11
wholetone =: +: i. 6

NB. moreso from generalized musical intervals and transformations now,
NB. david lewin

NB. based on model of fundamental frequency where
NB. int | *&freq
NB. +P4 | 4r3
NB. +M3 | 5r4
NB. basically group is triples 2 3 5 ^ triple under multiplication of
NB. ratios or addition of exponents...
DOM =: _1 1 0
MED =: _2 0 1
*/ 2 3 5 ^ DOM - MED

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
3 0 1 2 2 0 2 2 0 2 2 0 -: IXV 1 3 6 9
2 0 1 2 1 0 1 2 1 0 2 4 -: IXV 3 4 7 8
1 0 0 0 1 2 1 0 2 2 0 0 -: IXV 8 9 0
1 0 0 2 2 0 1 2 1 0 0 0 -: IXV 0 3 4
6 6 -: DSYM wholetone
1 1 -: DSYM 0 2 4
2 2 -: DSYM 0 1 6 7
0 1 3 7 ZREL 0 1 4 6
-. 1 3 5 ZREL 0 2 4
-. 0 1 ZREL 1 2 3 4
CREL 2 3 4 5 6 7
CREL 0 1 2 3 4 6
CREL wholetone
1 1 1 1 -: COM i.6
0 1 0 0 -: COM 0 1 2 3 6 8
0 1 1 0 -: COM 0 1 2 4 5 8
0 1 1 0 -: COM 0 1 2 3 5 7
0 1 0 1 -: COM 0 1 2 3 6 9
0 2 2 0 -: COM 0 1 3 6 7 9
3 3 3 3 -: COM 0 1 4 5 8 9
6 6 6 6 -: COM wholetone
)

0!:2 assertions

NB. major (+/@,@(=/))"1 Z12 /:~@T12"0 _/ minor
NB. major (+/@,@(=/))"1 Z12 /:~@T12"0 _/ major
NB. inversions =: (12 | (- {.))"1 @ NR
NB. inversions 0 3 7 9

require 'tables/csv'

rsep =: LF
csep =: ','
qchr =: '"'

eg =: jpath '~/code/city-trees/arbres/montréal/arbres-publics.csv'
NB. jpath '~/code/Covid19Canada/timeseries_prov/cases_timeseries_prov.csv'

dat =: 1!:1 < eg

SC =: qchr;csep;rsep
SA =: a. (e.&> i. 1:)"0 _ SC
NB. unq appears to be faster than unq0
unqq =: #~ [: -. (2#qchr)&E. NB. remove double quotes ""
unq =: unqq@}.@}: ^: ((2#qchr) -: 0 _1&{) NB. unqq after removing enclosing "
dquo =: 0 (0 _1)} (*: ~:/\) @ (qchr&=)
unq0 =: (#~ dquo) ^: ((2#qchr) -: 0 _1&{) NB. unqq after removing enclosing "

cln =: unq`{{''}}@.(-:&(,csep)) NB. clean field (empty fields parsed as commas)

NB. build in state to handle numbers? will be hairier...
NB. need classes for - , e
]SM =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. neutral
0 6  0 2  0 3  1 0 NB. tok, error to see quote
3 0  2 0  2 0  2 0 NB. qtok, quote escapes self
2 0  0 2  0 3  2 0 NB. escq
)

row =: (0;SM;SA)&;:
rowc =: (4;SM;SA)&;:
hdr =: row @: ({.~ i.&rsep)
pcsv =: row;._2 NB. technically, row sep may be inside quotes, but
		NB. this simplifies things and is a pinch faster than
		NB. running state machine on whole.

pcsvcln =: ([: cln &.> row);._2

NB. want to parse column as uniform datatype, preferably numeric
pcol =: 3 : 0
hdr =. {. y
hdr
)

dquo =: 0 (0 _1)} (*: ~:/\) @ (qchr&=)

(#~ dquo) '"ab""ba"'

NB. cln &.> row '"b""a",t,,"ca\t"'
NB. 'unq1 &.> row 51 {. dat' bonsai 'row 51 {. dat'
NB.$  trees =: pcsv dat
NB. ({. trees) i. < 'Essence_fr'

NB. $ > }. 10 {. 12 { |: trees


require 'tables/csv'

rsep =: LF
csep =: ','
qchr =: '"'

eg =: jpath '~/code/city-trees/arbres/montréal/arbres-publics.csv'
NB. jpath '~/code/Covid19Canada/timeseries_prov/cases_timeseries_prov.csv'

dat =: 1!:1 < eg

SC =: qchr;csep
SA =: a. (e.&> i. 1:)"0 _ SC
unqq =: #~ [: -. (2#qchr)&E.
unq =: unqq@}.@}: ^: ((2#qchr) -: 0 _1&{)
cfld =: unq`{{''}}@.(-:&(,csep)) NB. clean field

]SM =: 4 3 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  1 1 NB. neutral
0 6  0 2  1 0 NB. tok, error to see "
3 0  2 0  2 0 NB. qtok, " escapes self
2 0  0 2  2 0 NB. escq
)

cdr =: [: <;._2 ,&csep @ ({.~ i.&rsep)
row =: (0;SM;SA)&;:
hdr =: row @: ({.~ i.&rsep)
pcsv =: row;._2

0 ". '123 abcd 123'
unq &.> row '"a,""",d,e,f'
row '"bat","cat","dog"'
cfld &.> row '"b""a",t,,"ca\t"'
NB. 'unq1 &.> row 51 {. dat' bonsai 'row 51 {. dat'

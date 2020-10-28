require 'tables/csv'

rsep =: LF
csep =: ','
eg =: jpath '~/code/Covid19Canada/timeseries_prov/cases_timeseries_prov.csv'
dat =: 1!:1 < eg

SC =: '"';'\';csep
SA =: a. (e.&> i. 1:)"0 _ SC
unq =: }.@}: ^: ('""' -: 0 _1&{)
unq1 =: }.@}: ^: ([: *./ '"' = 0 _1&{)

]SM =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 6  0 3  1 1 NB. neutral
0 6  1 0  0 3  1 0 NB. tok
0 0  3 0  2 0  2 0 NB. qtok
2 0  2 0  2 0  2 0 NB. esc
)

hdr =: [: <;._2 ,&csep @ ({.~ i.&rsep)
row =: (0;SM;SA)&;:
mdr =: row @: ({.~ i.&rsep)
pcsv =: row;._2
NB. pcol =:
0 ". '123 abcd 123'
row 'a,"b"",c",c'
NB. 'unq1 &.> row 51 {. dat' bonsai 'unq &.> row 51 {. dat'

load 'data/jsv stats/bonsai plot'

NB. why?
data =: 3 }. 1!:1 < 'Stations.csv'
sel =: {{ (1,({.y)i.<x){::y }}
msk =: {{ x -:"1 (#x) {."1 y }}"1
stations =: pcsv data
headers =: {. stations

qcs =: 'QUEBEC' msk 'Province' sel stations
css =: '2020' -:"1 'Last Year' sel stations
,. headers

lons =: 0 ". 'Latitude (Decimal Degrees)' sel stations
lats =: 0 ". 'Longitude (Decimal Degrees)' sel stations
coords =: lons ,. lats
mtl =: 45.5 _73.6
winds =: 42.3 _83
chicchoc =: 48.5 _65.5
stats =: 30 {. /: +/"1 | coords -"1 chicchoc
stats =: (#~ e.&(I. css)) stats
stats { 'Name' sel stations
stats { 'First Year' sel stations
stats { 'Station ID' sel stations
stats { coords

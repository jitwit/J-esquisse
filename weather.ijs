load 'plot tables/csv ../jsv/jsv.ijs'

station =: 5415
years =: (makenum@readcsv) &.> 1 dir 'weather/',(":station),'*.csv'
hdrs =: {. > {. years
csvcol =: {{ ,>}. (hdrs i. < m) {"1 y }}
sgnd =: 'Snow on Grnd (cm)' csvcol

pd 'reset; title snow on ground in mtl'
pd 'xcaption day; ycaption cm;visible 0; pensize 2'
pd 'color 20 160 255,40 200 140'
pd (+/%#) 365 {."1 sgnd &> 32 {. years
pd (+/%#) 365 {."1 sgnd &> _32 {. years
pd 'key "past" "recent"'
pd 'show'

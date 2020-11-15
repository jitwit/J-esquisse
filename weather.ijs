load 'plot tables/csv ../jsv/jsv.ijs'

station =: 5415
years =: (makenum@readcsv) &.> 1 dir 'weather/',(":station),'*.csv'
hdrs =: {. > {. years
csvcol =: {{ ,>}. (hdrs i. < m) {"1 y }}
sgnd =: 'Snow on Grnd (cm)' csvcol
snow =: 'Total Snow (cm)' csvcol
rain =: 'Total Rain (mm)' csvcol
maxt =: 'Max Temp (°C)' csvcol
mint =: 'Min Temp (°C)' csvcol

plot_snow_ground =: 3 : 0
pd 'reset; title snow on ground in mtl'
pd 'xcaption day; ycaption cm;visible 0; pensize 2'
pd 'color 20 160 255,40 200 140'
pd (+/%#) 365 {."1 sgnd &> 32 {. years
pd (+/%#) 365 {."1 sgnd &> _32 {. years
pd 'key "past" "recent"'
pd 'show'
)

plot_snow =: 3 : 0
pd 'reset;visible 0; title snow frequency by day in mtl (smoothed)'
pd 'xcaption day; ycaption P(snow);type dot'
pd 'color 20 160 255,40 200 140'
pd 30 (+/%#)\ (+/%#) * 365 {."1 snow &> 32 {. years
pd 30 (+/%#)\ (+/%#) * 365 {."1 snow &> _32 {. years
pd 'key past recent;keypos middle'
pd 'show'
)

plot_rain =: 3 : 0
pd 'reset; title rain frequency by day in mtl (smoothed)'
pd 'xcaption day; ycaption P(rain);visible 0; type dot'
pd 'color 20 160 255,40 200 140'
pd 30 (+/%#)\ (+/%#) * 365 {."1 rain &> 32 {. years
pd 30 (+/%#)\ (+/%#) * 365 {."1 rain &> _32 {. years
pd 'key past recent;keypos middle'
pd 'show'
)

plot_temp =: 3 : 0
tf =. _30
pd 'reset; visible 0; title temperature in mtl'
pd 'xcaption month; ycaption C'
pd 'color 20 160 255,20 160 255,40 200 140,40 200 140'
pd 'pensize 2'
pd tf (+/%#)\ (+/%#) 365 {."1 maxt &> 32 {. years
pd tf (+/%#)\ (+/%#) 365 {."1 mint &> 32 {. years
pd tf (+/%#)\ (+/%#) 365 {."1 maxt &> _32 {. years
pd tf (+/%#)\ (+/%#) 365 {."1 mint &> _32 {. years
pd 'show'
)

plot_snow_ground ''

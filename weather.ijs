load 'plot tables/csv ../jsv/jsv.ijs'
dat =. 1!:1 < 'weather/51157-2015.csv'
7!:2 'pcsv dat'

NB. for 4715, first 23 years are blank 

station =: 5415

sel =: {{ (1,({.y)i.<x){::y }}


NB. years =: 23 }. rcsv &.> 1 dir 'weather/',(":station),'*.csv'
years =: rcsv &.> 1 dir 'weather/',(":station),'*.csv'
hdrs =: {. > {. years
sgnd =: [: , [: ". 'Snow on Grnd (cm)'&sel
snow =: [: , [: ". 'Total Snow (cm)'&sel
rain =: [: , [: ". 'Total Rain (mm)'&sel
maxt =: [: , [: ". 'Max Temp (°C)'&sel
mint =: [: , [: ". 'Min Temp (°C)'&sel

plot_snow_ground =: 3 : 0
pd 'reset; title snow on ground'
pd 'xcaption day; ycaption cm;visible 0; pensize 2'
pd 'color 20 160 255,40 200 140'
pd (+/%#) 365 {."1 sgnd &> }: years NB. current year incomplete so }:
pd 'show'
)

plot_snow =: 3 : 0
h =. <. -: # years
pd 'reset;visible 0; title snow frequency by day (smoothed)'
pd 'xcaption day; ycaption P(snow);type dot'
pd 'color 20 160 255,40 200 140'
pd 30 (+/%#)\ (+/%#) * 365 {."1 snow &> }: years
pd 'key past recent;keypos middle'
pd 'show'
)

plot_rain =: 3 : 0
pd 'reset; title rain frequency by day in mtl (smoothed)'
pd 'xcaption day; ycaption P(rain);visible 0; type dot'
pd 'color 20 160 255,40 200 140'
pd 30 (+/%#)\ (+/%#) * 365 {."1 rain &> }: years
pd 'key past recent;keypos middle'
pd 'show'
)

plot_temp =: 3 : 0
tf =. _30
pd 'reset; visible 0; title temperature'
pd 'xcaption month; ycaption C'
pd 'color 20 160 255,20 160 255,40 200 140,40 200 140'
pd 'pensize 2'
pd tf (+/%#)\ (+/%#) 365 {."1 maxt &> years
pd tf (+/%#)\ (+/%#) 365 {."1 mint &> years
pd 'show'
)

plot_snow ''

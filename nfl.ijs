NB. page rank to rank sports teams?
NB. a loss adds link of weight 1 from losing team to winning team, a
NB. draw adds links of weight 0.5 between both. then, rows are
NB. normalized and page rank executed.
NB. seems to give reasonable results?

NB. https://www.pro-football-reference.com/boxscores/game-scores.htm
NB. header: Rk,Score,PtsW,PtsL,PtTot,PD,Count,,TeamA,TeamB
NB. first need to clean by changing the 3rd space from end of each line to comma
date_comma =: {{ LF ,~ ',' (3 i:~ +/\. ' '=y)} y }}

clean_dates =: 3 : 0
; (<@date_comma);._2 y,LF
)

clean_csv =: 3 : 0
(<'data/clean.csv') 1!:2~ clean_dates 1!:1 < 'data/games.csv'
)

teams =: 8 9
date =: 10
pd =: 5

load 'jsv.ijs'
data =: pcsv 1!:1 < 'data/clean.csv'
getyear =: {{ data #~ ([: +./ ((":y)&E.)) &> date {"1 data }}
games =: 101 {. getyear 2020
teams2020 =: /:~ ~. , teams {"1 games
row =: {{ (". pd {:: y) ,~ teams2020 i. teams { y }}
results =: row"1 games

weight =: 3 : 0
weights =. 0 $~ ,~#teams2020
for_r. results do.
  eg =. 2 {. r
  if. * {: r do. weights =. (1 + (<eg){weights) (<eg)} weights
  else. weights =. (0.5 + ((;|.)eg){weights) ((;|.)eg) } weights end.
end. (%+/)"1 weights
)

mat =: weight''
page_rank=: ([: %. =@i.@#@] - *) +/ .* ((]#(1:-[)%])#@])
NB. gives sort of reasonable ranking, but why aren't 0-8 jets last?
> teams2020 {~ /: 0.85 page_rank |: mat

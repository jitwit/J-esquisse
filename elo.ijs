load 'plot'

NB. x E y, expected score of player with rating x based on ratings x
NB. and y.
E =: 1 % 1 + 10 ^ 400 %~ -~ NB. expected result
k =: 32 NB. k factor

NB. 'visible 0' plot (; E&1000) 10 * i. 200

NB. "performance"
NB. table of ratings/results
NB. provisional rating is average(rating + 400*result)
NB. where result is -1 for loss, 0 for draw, 1 for win.
P =: [: +/ [: (+/%#) 1 800 (*"1) 0 _0.5 (+"1) ]

eg =: ".;._2 ] 0 : 0
2024 1
2161 0
1547 0.5
1785 1
1979 1
2176 0
2181 1
2048 1
)

P eg

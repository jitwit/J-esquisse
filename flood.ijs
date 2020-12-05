NB. flood fill
dim =: 50 12
G =: ?. #/ dim
W =: (>./\. <. >./\) G
|. |: ' .@' {~ +/"_1 (G,.W) >:/ i. {: dim
swg =: 200 240 255, 10 35 120 ,: 0 180 80 NB. sky/water/ground
swg viewmat |. |: +/"_1 (G,.W) >:/ i. {: dim

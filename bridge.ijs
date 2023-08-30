NB. shape simulations
S =: ,/ @: (\:~) @: (#/.~)
DS =: /:~ (S @: (13&{.))"1] 4 | ?~ 100 # 52
NB. (({.,#)/.~) {."1 DS
NB. (({.,#)/.~) +/"1 ] 1 = DS

NB. probability of cards falling a to E and b to W with y cards left (a b =. x)
Pd =: {{ (2^(a~:b))*(a!y)*(b!y)%((a+b)!2*y) [ 'a b' =. x }}
NB. make a table of these probabilityes
T =: {{ ds ; ,. 13 Pd~"1 [ ds =. (,.y&-) i.->.-:>:y }}
T"0 >: i. 8

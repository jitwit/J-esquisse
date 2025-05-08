load'~/code/jsv/jsv.ijs'
C =: rcsv 'data/penis-size-by-country-2025.csv'
G =: , ". 4 {::"1 }. C NB. girth (in)
L =: , ". 2 {::"1 }. C NB. length (in)
V =: , ". 6 {::"1 }. C NB. length (in)
X =: I. G > L          NB. indices 
T =: (X{,/1{::"1}.C);(,.X{L);(,.X{G)
P =: \: X { G % L
(;:'country length girth') ,: P&{ &.> T

Y =: I.(0{::,}.C)e.('IL',:'PS')
(;:'country length girth volume') ,: (Y{,/1{::"1}.C);(,.Y{L);(,.Y{G);(,.Y{V)
Y =: I.(0{::,}.C)e.('IN',:'PK')
(;:'country length girth volume') ,: (Y{,/1{::"1}.C);(,.Y{L);(,.Y{G);(,.Y{V)
Y =: I.(0{::,}.C)e.('ME','BA','HR',:'RS')
(;:'country length girth volume') ,: (Y{,/1{::"1}.C);(,.Y{L);(,.Y{G);(,.Y{V)

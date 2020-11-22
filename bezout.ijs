NB. bezout/extended euclid
bez =: 4 : 0
 'a b c d s t' =. 1 0 0 1,x,y
 while. r =. t - s*q =. <. t%s do.
   c =. t [ a =. c-q*a [ t =. a
   d =. t [ b =. d-q*b [ t =. b
   s =. r [ t =. s
 end. a,b,s assert. s = (a*x) + b*y
)

NB. chinese remainder theorem
crt =: 4 : 0
 's t g' =. m bez n [ 'b n' =. y [ 'a m' =. x
 (m*n%g) (|,[) (a*n*t) + (b*m*s)
)

NB. for example:
NB.    crt/ _2 ]\ 0 3  3 4  4 5
NB. 39 60
NB.    0 3 4 -: 3 4 5 | 39
NB. 1

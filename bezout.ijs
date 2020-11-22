NB. bezout/extended euclid
bez =: 4 : 0
 'a b c d s t' =. 1 0 0 1,x,y
 while. r =. t - s*q =. <. t%s do.
   c =. t [ a =. c-q*a [ t =. a
   d =. t [ b =. d-q*b [ t =. b
   s =. r [ t =. s
 end. a,b,s NB. assert. s = (a*x) + b*y
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

load '~addons/math/misc/gcd.ijs stats/bonsai'

NB. failed F:: attempt: t =. (x0 =. 0 1,{.y) ]F:.(bez~ {:) }.y
NB. matching  ~addons/math/misc/gcd.ijs interface
GCD =: 3 : 0
 as =. 2 {. 'a b g' =. bez/ 2 {. y
 for_j. 2 }. y do. as=.b ,~ a*as [ 'a b g' =. g bez j
 end. g ; as assert. g = y +/ . * as
)

NB. from benches on egs and similar, this implementation smokes the
NB. addon one. even on small inputs, this wins by around 20-50%. with
NB. or without using 'x:'
NB. ]eg =: 2 ^ i. _100
NB. ]eg =: 1000 ?. 100000x
]eg =: 2 ^ i. _100
bonsai 'GCD 14 35 13'
bonsai 'gcd 14 35 13'


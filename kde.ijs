NB. kernel density estimation
NB. have sample X = (x1, ..., x_n)
NB. choose kernel function K >: 0, and calculate fhat_h(x) = +/ K_h (x-X) where
NB. K_h(x) = 1/h K(x/h)
load'stats/base plot'

qtile =: 4 : 0
 ws=. (%+/)"1 -. | xs -"0 1 is=. (<.,>.)"0 xs=. x * <:#y
 ws (+/"1 @: *) is { /:~ y
)

IQR =: -/ @: (0.75 0.25&qtile)

X =: _2.1 _1.3 _0.4 1.9 5.1 6.2

bandwidth =: 0.9 * (stddevp * 5 %: 4r3 % #) <. (0.746269 * IQR)

NB. n sample, u kernel, y point
kde =: {{ (h%#n) * +/ u (y - n) * h =. % bandwidth n }}

NB. standard normal pdf
phi =: (%:%2p1) * [: ^ _0.5 * *:
eg =: (phi kde X)"0
'visible 0' plot (1r10*i:100);'eg'

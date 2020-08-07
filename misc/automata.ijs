rule =: 1 : '(2#.y){|.(8#2)#:m'
step =: 1 : 'm rule |: _1 0 1|."0 _/ y'
NB. (; (|: @ ,: @ (30 rule))) (2 2 2 #: i. 8)
run =: 1 : 0
(m step) ^: (i. 1+y) 0 = i: y
)

require 'viewmat'

'.#' {~ 30 run 30

viewmat ^: IFQT 30 run 200

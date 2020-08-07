M=: 7x+10^9x
sqr=: [|*:@]

pow=: 1 : 0
n =. # bs=. #: y
(m | *)/ 1x >. bs * (m&sqr) ^: (i. - n) x
)


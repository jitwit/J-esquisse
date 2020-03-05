points=: ?100 2$0
l2=: [: +/ [: *: -
cluster=: ] </.~ [: (i. <./)"1 [: |: l2"1 _1/
unpack=: (>@{.,$:@}.)`]@.(0=#)
init=: ] cluster~ ] {~ [ {. [: ?~ #@]
iter=: (}:@unpack) cluster~ [: > (+/%#) &.>
kmeans=: [: iter ^: _ init

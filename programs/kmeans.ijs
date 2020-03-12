points=: ? 10 2$0
l2=: [: +/ [: *: -
cluster=: ] </.~ [: (i. <./)"1 [: |: l2"1 _1/
init=: ] cluster~ ] {~ [ {. [: ?~ #@]
iter=: ; cluster~ [: > (+/%#) &.>
kmeans=: [: iter^:_ init
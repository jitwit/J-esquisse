NB. have 2d grid. piles (x,y) with >= 4 units of sand spill over to
NB. neighbors.

NB. grid with x units of sand in center of grid of size y. y may be a
NB. single number in which case the grid is square or a 2-array is
NB. given, the shape is mxn.
grid=: dyad : 'x (<2$<.-:y)} (2$y)$0'

NB. the current sand matrix is added with the change in sand by hook.
NB. the change is _4 at all the locations with 4&<:, plus the spilled
NB. sand from rotating (|.) the locations with >: 4 sand by
NB. _2 ]\ _1 0 0 _1 1 0 0 1 and adding (+/).
NB. this implementation has the grid wrapping around so that sand on
NB. the top may spill to the bottom. the fit conjunction |.!.0 could
NB. be used if sand should spill off the world instead.
sand=: +[:(_4&* + [:+/(_2]\_1 0 0 _1 1 0 0 1)&|.) 4&<:

NB. reach a fix point and display using viewmat
spill=: [: viewmat sand ^: _
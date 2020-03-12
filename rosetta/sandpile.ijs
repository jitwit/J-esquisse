NB. have 2d grid. piles (x,y) with >= 4 units of sand spill over to
NB. neighbors.
 
NB. grid with x units of sand in center of grid of size y. y may be a
NB. single number in which case the grid is square or a 2-array with
NB. the dimensions y0 y1.
grid=: dyad : 'x (<<.-:2$y)} (2$y)$0'
 
NB. the current sand matrix is added with the change in sand by hook.
NB. the change is _4 at all the locations with 4&<:, plus the spilled
NB. sand from rotating (|.) by neighborhood _2 ]\ _1 0 0 _1 1 0 0 1 
NB. and adding (+/). this implementation has the grid wrapping around
NB. so that sand on the top may spill to the bottom. the fit conjunction 
NB. |.!.0 could be used if sand should spill off the world instead.
nhood=:_2]\_1 0 0 _1 1 0 0 1
sand=:+[:(_4&*+[:+/nhood&|.)3&<
 
NB. reach a fix point (^: _) and display the sand using viewmat.
require 'viewmat'
spill=: [: viewmat sand ^: _
 
NB. if in jqt use viewmat to display an abelian sandpile.
spill ^: IFQT 1024 grid 25

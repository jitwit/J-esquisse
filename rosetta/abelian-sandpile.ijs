grid=: dyad : 'x (<<.-:2$y)} (2$y)$0'

nhood=: _2]\_1 0 0 _1 1 0 0 1
sand=: +[:(_4&*+[:+/nhood&|.)3&<

require 'viewmat'
spill=: [: viewmat sand ^: _
spill ^: IFQT 1024 grid 25

require 'plot'

iter=: (, 1 , +@|.) @: (,~ 0j_1 ,~ 0j_1*|.)
hilbert=: 3 : '0j1+(%{:) +/\0,iter ^: y '''''

plot ^: IFQT hilbert 5
require 'plot'

iter=: (, 1 , +@|.) @: (,~ 0j_1 ,~ 0j_1*|.)
H=: monad : '0j1+(%{:) +/\0,iter ^: y '''''

plot ^: IFQT H 5
require 'plot'

iter=: (, 1 , +@|.) @: (,~ 0j_1 ,~ 0j_1*|.)
H=: 3 : '0j1+(%{:) +/\0,iter ^: y '''''
style =: 'aspect 1;grids 0 0;labels 0 0;tics 0 0'

style plot H 8

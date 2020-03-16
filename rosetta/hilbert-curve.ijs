require'plot'

NB. represent hilbert curve as list of complex numbers that can be
NB. summed to trace curve. H_0 is an empty string. Let R(H_n) be
NB. H_n reversed and L_n the first half of the curve nth order curve.

NB. L_{n+1} = (i * R(H_n)) , -i , H_n
NB. H_{n+1} = L_{n+1} , 1 , conjugate (R(L_{n+1})).
iter=: (, 1 , +@|.) @: (,~ 0j_1 ,~ 0j_1*|.)

NB. transform so points appear in unit square.
hilbert=: 3 : '0j1+(%{:) +/\0,iter ^: y '''''

plot ^: IFQT hilbert 5
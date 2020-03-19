require'plot'

koch=: {: ,~ [: ,/ 2 ([ + [: +/\ (0,1r3*1,(^j.(,-)_2 o.1r2)) * -~)/\ ]

tri=: ^ j. 4r3 * (_2 o. 0) * i._4
plot ^: IFQT koch ^: 5 tri

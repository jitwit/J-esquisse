NB. cantor enumeration for rationals
NB. http://massimozanetti.altervista.org/files/mydocs/kthRationalNumberCantorEnumeration.pdf
rx =: >.@-:@(%:&.>:)@(8&*) NB. ceil((sqrt(1+8*y)-1)/2)
ry =: + 0 1r2 _1r2 p. rx
cantor =: rx (] %~ 1 + -) ry
1r3 22r7 -: cantor 6 385

load 'stats/bonsai'
load '~addons/math/misc/quatern.ijs'

NB. represent quaternions as 4 vector?
NB. +/ . * 1,i,j,k
NB. i^2=j^2=k^2=-1
NB. ij=k, jk=i, ki=j, uv=-vu
Qcoef =. _4 ]\ 1 _1 _1 _1  1 1 1 _1  1 _1 1 1  1 1 _1 1 NB. coefficients for mult
Qperm =. _4 ]\ 0 1 2 3     1 0 3 2   2 3 0 1   3 2 1 0  NB. permutation for mult
Qx =: ([: +/"1 (Qperm { ]) * Qcoef *"1 [)"1 f. NB. multiplication
Qi =: (1 0 0 0 %. Qcoef * Qperm&{)"1 f.        NB. inversion by solving system
Qd =: Qx Qi                                    NB. division
Qn =: (+/@:*:)"1                               NB. norm
Qc =: (1 _1 _1 _1&*)"1                         NB. conjugation
Qu =: % Qn                                     NB. unit
Qp =: Qn , Qu                                  NB. polar form
Qmat =: (,:_1 1*+@|.)@:(_2&(j./\))             NB. 2x2 matrix representation over C
Qi =: (Qc % Qn)"1 f.                           NB. faster/more stable inv by conj
NB. apparently these are faster if rank fixed here instead of at use

'qr qi qj qk' =: = i. 4
qz =: 4$0
NB. cayley table:
QCayley =: _8 ]\ i.~ ,/ Qx"1/~ (,-) (= i. 4)

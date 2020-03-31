nuc_cnt=: [: +/ =/&'ACGT'
rna_tra=: 'ACGU'{~'ACGT'&i.
rev_com=: [:|.'TGCA'{~'ACGT'&i.
hamming=: +/ .(-.@=)
motif  =: 1+[:I.E.~
nuc_cnt=: [: +/"1 'ACGT'=/]
rna_tra=: 'ACGU' {~ 'ACGT'&i.
rev_com=: [: |. 'TGCA' {~ 'ACGT'&i.
hamming=: +/ .(-.@=)
perms=: i.@!A.i.
motif=: 1+[:I.E.~


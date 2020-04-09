
eg=: >{:"1 fasta example''
dna=: >{:"1 fasta rosalind'corr'
dist=: [: <./ 0 -.~ [ hamming~ (,:RC)@]
cmp=: (-:RC) +. -:
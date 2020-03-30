NB. tables
'mRNA COD'=: (3&{."1 ; {:"1) ];._2(1!:1) < 'rna-codon.txt'
'AMINO WEIGHT'=: ({."1 ; ([: ". 2&}.)"1) ];._2(1!:1) < 'monoisotropic-mass-table.txt'

NB. mRNA=: 3 {."1 COD
NB. codo=: {:"1 COD

NB. solutions
prot=: _3 (COD{~mRNA&i.)\ ]
mrna=: [:*/3x,[:+/COD=/] NB. 3x for stop and to force exact
prtm=: [:+/WEIGHT{~AMINO&i.

NB. answers
NB. prot }: 1!:1 < 'rosalind_prot.txt'
NB. 1000000 | mrna }: 1!:1 < 'rosalind_mrna.txt'
NB. ":!.8 prtm }: 1!:1 < 'rosalind_prtm.txt'

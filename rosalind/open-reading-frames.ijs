strand=: 0 1 {:: fasta rosalind'orf'
synth=: CODON{~mRNA&i.
read=: [:}:[:([:<]([:<}.~)"_ 0/[:I.'M'&=);._2'*',~_3(synth ::' ')\ rna_tra
open_frames=: a:-.~[:~.[:,[:>[:read"1[:,/[: (}.^:(i.3))"1 (,: rev_com)

strands=: {:"1 fasta rosalind'splc'

intrs=: _2 ,. \ #@],~0,[:,[:({.,.+/) #@[ (,:~ +) [:I.E.
spl=: [: ; ] (<;.0)~ intrs

solve=: monad define
dna=. >{.strands
for_s. }. strands do. dna=. dna spl~ >s end. _3 synth\ mRNA dna
)

solve strands
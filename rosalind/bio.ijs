require'regex' NB. small bioinf lib
coinsert'jregex'
load'io.ijs'

NB. parse argument string in fasta to boxed table
fasta=: ([:({.,[:<[:;}.)[:<;._2,&LF);._1

nuc_cnt=: [: +/ =/&'ACGT'

NB. RNA goes dna -> rna. RNA^:_1 goes rna -> dna
RNA=: ('ACGU '{~'ACGT'&i.) :. ('ACGT '{~'ACGU'&i.)

NB. reverse complement
RC=: [:|.'TGCA '{~'ACGT'&i.

NB. amount of GC nucleotides as percentage
GC_N=: #%~[:+/e.&'GC'

NB. codons and mrna coding
'mRNA CODON'=: (3&{."1 ; {:"1) ];._2 (1!:1)<'table/codon.txt'
CODONTABLE=: ([:/:~[:|:([:<"0 ~.),:</.&mRNA) CODON
START=: 'AUG'
STOPS=: mRNA {~ I. '*' E. CODON

NB. synth some ribonucleic acid to a codon
synth=: CODON{~mRNA&i.
NB. todo: readframe a bit inelegant. when synth fails (length < 3),
NB. just puts a space. this works because the last tail '*' gets
NB. chopped off by curtail }:.
ReadFrame=: [:}:[:([:<]([:<}.~)"_ 0/[:I.'M'&=);._2'*',~_3(synth ::' ')\ RNA
OpenFrames=: a:-.~[:~.[:,[:>[:ReadFrame"1[:,/[:(}.^:(i.3))"1(,:RC)

NCOV2=:'ACGT'{~'acgt'i.(LF,' 0123456789')-.~1!:1<'data/mn908947.3'
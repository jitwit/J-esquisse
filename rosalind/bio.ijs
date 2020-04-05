require'regex' NB. small bioinf lib
coinsert'jregex'
load'io.ijs'

NB. parse argument string in fasta to boxed table
fasta=: ([:({.,[:<[:;}.)[:<;._2,&LF);._1

NB. nucleotide count
NTC=: [:<:[:(#/.~)('ACGT'&,)

NB. mRNA goes dna -> mrna. mRNA^:_1 goes mrna -> dna
mRNA=: ('ACGU '{~'ACGT'&i.) :. ('ACGT '{~'ACGU'&i.)
COM=: 'TGCA '{~'ACGT'&i.
RC=: |.@COM f.

NB. amount of GC nucleotides as percentage
GC_N=: #%~[:+/e.&'GC'

NB. anticodons to amino acid table
'CODON AMINO'=: (3&{."1 ; {:"1) ];._2 (1!:1)<'table/codon.txt'
CODONTABLE=: ([:/:~[:|:([:<"0 ~.),:</.&CODON) AMINO
START=: 'AUG'
STOPS=: CODON {~ I. '*' E. AMINO

NB. synth some ribonucleic acid to a codon
synth=: AMINO{~CODON&i. f.
NB. todo: readframe a bit inelegant. when synth fails (length < 3),
NB. just puts a space. this works because the last tail '*' gets
NB. chopped off by curtail }:.
ReadFrame=: [:}:[:([:<]([:<}.~)"_ 0/[:I.'M'&=);._2'*',~_3(synth ::' ')\ mRNA
OpenFrames=: a:-.~[:~.[:,[:>[:ReadFrame"1[:,/[:(}.^:(i.3))"1(,:RC)

NCOV2=:'ACGT'{~'acgt'i.(LF,' 0123456789')-.~1!:1<'data/mn908947.3'
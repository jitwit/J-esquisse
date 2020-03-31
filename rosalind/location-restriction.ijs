]strand=: ' '-.~,}.];._2 rosalind 'revp'

pals=: (-:rev_com)\&strand
lrs=: ([:|:,:~) &.> [:>:&.><@I.@pals

'out.txt'fwrites~([:;lrs)4+i.9
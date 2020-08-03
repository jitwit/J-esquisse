NB. http://okmij.org/ftp/Computation/index.html#MarkovAlg

rulebu=: _3 ]\ '1';'0|';0;'|0';'0||';0;'0';'';0
rulegcd=: _3 ]\ 'aA';'Aa';0;'a#a';'A#';0;'a#';'#B';0;'B';'a';0;'A';'C';0;'C';'a';0;'#';'';0

input=: '110'

NB. x is rule set, y is string
markov=: 4 : 0
for_r. x do.
  'src rplc term' =. r
  if. # mch=. I. src E. y
  do. (({.mch){.y),rplc,((mch+&#src)}.y) return.
  end.
end. y
)



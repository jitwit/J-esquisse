NB. http://okmij.org/ftp/Computation/index.html#MarkovAlg
rulebu=: _3 ]\ '1';'0|';0;'|0';'0||';0;'0';'';0
rulegcd=: _3 ]\ 'aA';'Aa';0;'a#a';'A#';0;'a#';'#B';0;'B';'a';0;'A';'C';0;'C';'a';0;'#';'';0

NB. x is rule set, y is string
markov=: 4 : 0
for_r. x do.
  'src rplc term' =. r
  if. (-. term) * # mch=. I. src E. y
  do. (y{. ~ {.mch),rplc, y }. ~ ({.mch)+#src return.
  end.
end. y
)

test=: 3 : 0
NB. binary => unary
assert. '||||||' -: rulebu&markov ^: _ '110'
assert. '||||' -: rulebu&markov ^: _ '100'

NB. gcd
assert. (,:'a') -: rulegcd&markov ^: _ 'aaa#aaaaa'
assert. 'aa' -: rulegcd&markov ^: _ 'aaaaaa#aaaaaaaa'
assert. 'aaaa' -: rulegcd&markov ^: _ '#aaaa'
'ok'
)

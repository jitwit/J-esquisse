NB. y by y grid with x grains of sand in center
require 'viewmat'
coinsert 'jviewmat jgl2'

grid=: 4 : 'x (<<.-:2$y)} (2$y)$0'
gd=: grid&5

R=:(,-)(,:|.)0 1
I=:+[:(_4&*+[:+/R|.!.0])3&<
S=:I^:_
t=: +[:(+/@(((,-)2]\i:1)&(|.!.0))-4&*)3&<

ab=: -[:(4&*(-+/)((,-)2]\i:1)|.!.0])3&<
ab=: -[:+/@(-"_ 2((,-)2]\i:1)|.!.0])3&<


mw=: +[:+/@(_4&*,((,-)2]\i:1)|.!.0])3&<
ab=: -[:+/@(-"2((,-)=/~i.2)|.!.0])3&<

nhood=: (,-)=/~i.2
ac=: 1 :'y-+/(-"2 u|.!.0])y>:#u'

ab=: -[:+/@(-"2((,-)=/~i.2)|.!.0])3&<
jw=: ab ^: _
ts=: mw ^: _
(jw-:ts) gd 100
vmbw =: (0 0 0 ,: 255 255 255)&viewmat
vmbw (}: i: {:)"1 |: (ab ^: a:) (?2000) grid 51
vmbw +/ 2 ~:/\ (ab ^: a:) (?2000) grid 51
vmbw (ab ^: _) (?2000) grid 51

'(mw ^: _) 1000 grid 101' bonsai '(jw ^: _) 1000 grid 101'

ab ^: _ gd 100
jw gd 30

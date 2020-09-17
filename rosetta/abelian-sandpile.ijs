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

ab=: -[:+/@(-"2((,-)2]\i:1)|.!.0])3&<
nhood=: (,-)2]\i:1
ac=: 1 :'y-+/(-"2 u|.!.0])y>:#u'
jw=: nhood ac ^: _
ts=: mw ^: _
(jw-:ts) gd 100
'ts gd 100' bonsai 'jw gd 100'
nhood ac ^: _ gd 100





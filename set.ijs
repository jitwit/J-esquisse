require'stats/base'

same  =: 3 = {.
diff  =: [: *./ 1&=
ok    =: same +. diff
set   =: [: *./ [: ok"1 [: +/"1 @ ="1 @ |: 3 3 3 3&#:
sets  =: (#~ set"1) @ ({~ 3 comb #)
find  =: (] ; [ -. ]) {.@sets

findsets=: 3 : 0
for_i. i.#y do. for_j. 1+i+i.(#y)-i+1 do. for_k. 1+j+i.(#y)-j+1
do. ijk=. i,j,k if. set ijk { y do. ijk return. end.
end. end. end. ''
)

runset=: 3 : 0
if. #ijk=. findsets b [ 'b d'=. y
do. if. (12>:#b)*#d do. ((3{.d),b{~(i.#b)-.ijk);3}.d else. (b{~(i.#b)-.ijk);d end.
else. if. #d do. ((3{.d),b);3}.d else. y end. end.
)

cards=: ?&81
deal=: 3 : 0
(12&{. ; 12&}.) ?~ 81
)

rungame=: runset ^: a: 
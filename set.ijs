require'stats/base'

same  =: 3 = {.
diff  =: [: *./ 1&=
ok    =: same +. diff
set   =: [: *./ [: ok"1 [: +/"1 @ ="1 @ |: 3 3 3 3&#:
sets  =: (#~ set"1) @ ({~ 3 comb #)
find  =: (] ; [ -. ]) {.@sets

cards=: ?#&81


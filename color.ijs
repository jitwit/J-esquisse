NB. for comparison:
rgb32 =: 256 256 256&#:
rgbhex =: [: rgb32 16 #. ('0123456789ABCDEF'&i.)

Myuv =: ".(;._2) 0 : 0
0.299 _0.147   0.615
0.587 _0.289  _0.515
0.114  0.436  _0.1
)

Myiq =: ".(;._2) 0 : 0
0.299  0.5959  0.2115
0.587 _0.2746 _0.5227
0.114 _0.3213  0.3112
)

NB. matrix => invertible linear transform
T =: 1 : '((+/ . *)&u) :. ((+/ . *)&(%.u))'
NB. yuv : rgb <-> yuv
Tyuv=: Myuv T
Tyiq=: Myiq T

rgbcg=: 3 : 0
'a b' =. (<./,>./) y
if. (a < 0) +. 1 < b do. 0 0 0
else. <. 256 * y end.
)
C8 =: (0>.255<.<.) @ (256&*)    NB. clamp to [0,255]
C1 =: (1&<.) @ (0&>.) @ (%&255) NB. clamp to [0,1]
C =: C1 :. C8
I_11 =: %~ i:
I =: i. % <:
img =: C8 (Tyuv^:_1"1) (0.46&,)&> { ;~ +: <: +: I 500
NB. '~/j902-user/temp/viewmat.png' linki img

NB. path in color coordinates => palette
path =: 1 : 'x +"_ 1 (I u) */ y-x'
cpath =: 1 : 'C8 Tyiq^:_1"1 x (u path) y'
rcolor =: 3 : '0 _0.5 _0.5 + ? 0 0 0'
NB. (0.3 0.4 0.3 (100 cpath) 0.9 _0.3 _0.0) viewmat i. 100


NB. (,/ palette rcolor"0 (i. 4)) viewmat i. 1000

Tyiq"1 C1 255 * =/~ i. 3

NB. x set, y e. 0 1 
NB. '' gethue_jviewmat_ I 10
NB. default viewmat hue:!
NB. 255 * #: 7 | 3^i.6

palette =: 3 : 0
2 (199 cpath)/\ y
)
(#: 7 | 3^i.6)
lhue =: 0.9 - 0.4 * (I 6)
]vm_hue =: ,/ 2 (10 cpath)/\ Tyuv"1 (3 3 $ 0.9 0 0 0.3)
vm_demo =: i. 100 100
demo 1

demo =: 3 : 0
if. y
do. vm_hue viewmat vm_demo
else. viewmat vm_demo end.
)




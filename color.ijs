NB. for comparison:
load '~addons/media/imagekit/color_space.ijs'

Myuv =: ".(;._2) 0 : 0
0.2126 _0.09991   0.615
0.7152 _0.33609  _0.55681
0.0722  0.436    _0.05639
)

Myuv =: ".(;._2) 0 : 0
0.299 _0.147   0.615
0.587 _0.289  _0.515
0.114  0.436  _0.1
)
NB. matrix => invertible linear transform
T =: 1 : '((+/ . *)&u) :. ((+/ . *)&(%.u))'
NB. yuv : rgb <-> yuv
Tyuv=: Myuv T 

rgbcg=: 3 : 0
'a b' =. (<./,>./) y
if. (a < 0) +. 1 < b do. 0 0 0
else. <. 256 * y end.
)
C8 =: (0 >. 255 <. <.) @ (256&*) NB. clamp to [0,255]
C1 =: (1&<.) @ (0&>.) @ (%&256) NB. clamp to [0,1]
C =: C1 :. C8
I_11 =: %~ i:
img =: C8 (Tyuv^:_1"1) (0.4&,)&> { ;~ -: I_11 350
'~/j902-user/temp/viewmat.png' linki img


load '~addons/media/imagekit/color_space.ijs'
Myuv =: ".(;._2) 0 : 0
0.2126 _0.09991   0.615
0.7152 _0.33609  _0.55681
0.0722  0.436    _0.05639
)

Myuv3 =: ".(;._2) 0 : 0
0.299 _0.147   0.615
0.587 _0.289  _0.515
0.114  0.436  _0.1
)

NB. yuv : rgb <-> yuv
Tyuv=: ((+/ . *)&Myuv) :. ((+/ . *)&(%.Myuv))
rgbc=: (255 <. 0 >. <.) @ (256&*)
I =: i. % <:
img =: rgbc (Tyuv^:_1"1) (0.6&,)&> { ;~ _0.5 + I 600
'~/j902-user/temp/viewmat.png' linki img

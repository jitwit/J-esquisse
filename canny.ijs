NB. canny edge detection
grayscale=: _8 (33 b.) 128 + 77 150 29&(+/ . *)"1
b55 =: 159 %~ _5 ]\ 2 4 5 4 2  4 9 12 9 4  5 12 15 12 5  4 9 12 9 4  2 4 5 4 2
sobel_y =: |: sobel_x =: 1 2 1 */ 1 0 _1
dirs =: 1r8p1 + 1r4p1 * i. 4
dir_ix33=: _4 (_2 <\ ])\  1 0  1 2   0 2  2 0   0 1  2 1   0 0  2 2
dir =: 4 | dirs I. 1p1 | 12 o. ]

NB. intensity gradient
grad_i =: 3 3 (sobel_x&* j. & (+/@,) sobel_y&*) ;._3 ]

NB. gaussian blur
gauss_f =: 5 5 (+/ @ , @ (b55&*)) ;._3 ]

NB. ask if maximal along direction
suppress0=: 3 : 0
z * *./ z (>: & |) y {~ dir_ix33 {~ dir z =. y {~ <1 1
)

NB. surpress non maximums
suppress_nonmax =: 3 3 suppress0 ;._3 ]

NB. keep edges near strong edges (ones above threshold u)
hysteresis=: 1 : 0
3 3 *@:(4&{ * 2&e.)@:, ;._3 u I. y
)

NB. grayscale => blur => intensity grad => directional maxes => threshold
canny=: 1 : 0
u hysteresis | suppress_nonmax grad_i gauss_f grayscale y
)

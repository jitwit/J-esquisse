NB. http://yann.lecun.com/exdb/mnist/
require 'mnist-load.ijs'

viewdig =: (60 10 50 ,: 220 220 120)&viewmat

sig =: 1 % 1+^@:-
softmax =: (% +/) @: ^
argmax =: (% +/) @: (= >./)
relu =: 0&>.

NB. plot (; sig) 20 %~ i: 100
dim_in =: # {. training
dim_batch =: 128
dim_out =: 1 + >./ labels

W1 =: (dim_batch,dim_in) $ 0
W2 =: (dim_out,dim_batch) $ 0

forward =: W2&(+/ . *) @: relu @: (W1&(+/ . *))

rec =: argmax @: softmax @: forward

lab =: {&(labels =/ i. dim_out)
img =: {&training

err =: lab - rec
err"0 i. 10

dat1 =: ? 10000#0

sig2 =: (% >:) @ ^
sig3 =: (% >:) @: ^
+/"1 | (sig -"_ _1 sig2 ,: sig3) dat1


NB. http://yann.lecun.com/exdb/mnist/
require 'mnist-load.ijs'

viewdig =: (60 10 50 ,: 220 220 120)&viewmat

sigmoid =: (% >:) @ ^
softmax =: (% +/) @: ^


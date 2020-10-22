NB. http://yann.lecun.com/exdb/mnist/
uncompress =: 3 : 0
NB. was used to decompress downloaded stuff
([: 2!:0 'gzip -d '&,) &.> 1 dir 'data/*.gz'
)

header =: _2 (3!:4) [: , _4 |.\ 16&{.
images =: 3 : 0
s =. 2 }. header y
(-*/s) ]\ 16 }. a. i. y
)

classes =: 8 }. a.&i.


NB. format is magic number identifying file, then each image or label
NB. is decoded as

training =: 255 %~ images 1!:1 < 'data/train-images-idx3-ubyte'
trainingt =: 255 %~ images 1!:1 < 'data/t10k-images-idx3-ubyte'
labels =: classes 1!:1 < 'data/train-labels-idx1-ubyte'
labelst =: classes 1!:1 < 'data/t10k-labels-idx1-ubyte'

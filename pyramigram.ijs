NB. from history of apl in 50 functions

NB. make triangle of letters that has each row differ only in 1
NB. letter, the letters are in random order, and they are separated by
NB. spaces with equal spaces on each side.
pg =: {{}:"1(-i.-y)|."0 1>(<@:,@:({&(' ',.~a.{~97+?~26))@:?~)"0>:i.y}}
<@pg"0 ] 2*1+i.4

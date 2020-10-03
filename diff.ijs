in =: 1!:1 < 'hsu.ijs'
out =: 1!:1 < 'hsu-out.txt'

diff =: 4 : 0
NB. input x, output y, strip input from output
x=. <;._2 x [ y=. <;._2 y [ o=. ''
while. #x do. lx=. >{.x [ ly=. >{.y
  if. -. (ly-:'   ',lx) +. ly-:lx
   do.   o =. o,ly,LF [ y=. }.y
   else. x=. }.x [ y=. }.y end.
end. o
)

in diff out

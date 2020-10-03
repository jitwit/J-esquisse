diff =: 4 : 0
NB. input chars x, output chars y.
NB. strip input from output from having run '0!:1'.
x=. <;._2 x [ y=. <;._2 y [ o=. ''
while. #x do. lx=. >{.x [ ly=. >{.y
  if. -. (ly-:'   ',lx) +. ly-:lx
   do.   o =. o,ly,LF [ y=. }.y
   else. x=. }.x [ y=. }.y end.
end. o
)

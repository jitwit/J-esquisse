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

lmy=: 4 : 'y,(0{x){(1+(1{x)<.{:y),2{x'

lmx=: 4 : 0
 b=. (_1+#y){x
 d=. {:y
 m=. (}.<.}:) d
 y , > lmy&.>/ (|.<"1 b,.m,.}:d),<#y
)

LM=: =/~ lmx^:(#@[) ,:@i.@>:@#@[

'Saturday' LM 'Sunday'

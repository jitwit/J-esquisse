parse=: 3 : 0
cases=. '' [ y=. }. y [ n=. >{.y
while. 0<n
do. cases =. cases , < > m {. y =. }. y [ m =. >{.y
    n =. <: n [ y =. m }. y
end. cases
)

input=: parse (<@".);._2 LF,~ 1!:1 < 'in.vacuumba'

prep=: [: |. 0j1 0 , ([: r. 2r360p1 * {."1) ,. {:"1
move=: *&{. , {:@] + *&{. * {:@[
robot=: +. @ {: @ (move/) @ prep

robot &> input

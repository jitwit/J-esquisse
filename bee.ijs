NB. NYT spelling bee solver
D =: <;._2 CR-.~1!:1<'data/collins.txt'
B =: (3<#@]) * [:*./e.~ * [:+./{.@[e.]
bee =: {{ ,. (/: #&>) D #~ (x,y)&B &> D }}
'P' bee 'TRIALM'

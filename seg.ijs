NB. segment intersection where segments represented as row vectors of
NB. 2x2 matrix. if no intersection, empty vector returned solves
NB. linear equation determined by property that intersection is
NB. simultaneously colinear with endpoints of argument segments, ie

NB. given segment ab, intersection x satisfies:
NB.   0 = -/ .* (x , ab) ,. 1
NB. two such segments provide necessary linear system.

intersect =: , @: ,:&(-/ .*) %. ,:&([:|.1 _1*-/)

line2d=: intersect :: ''
seg2d=: 4 : 0
try. assert. 1 1 0 0 -: , y <: z =. x intersect y
     assert. 1 1 0 0 -: , x <: z
     z
catch. '' end.
)

S1=: 4 0 ,: 6 10
S2=: 0 3 ,: 10 7
S3=: 0 3 ,: 10 7.1
S4=: 0 0 ,: 1 1
S5=: 1 2 ,: 4 5
S6=: 1 _1 ,: 4 4
S7=: 2 5 ,: 3 _2


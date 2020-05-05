NB. segment intersection where segments represented as row vectors of
NB. 2x2 matrix. doesn't detect if no intersection. nan error if lines
NB. parallel. solves linear equation determined by property that
NB. intersection is simultaneously colinear with endpoints of argument
NB. segments, ie given segment ab, intersection x satisfies:
NB. 0 = -/ .* (x , ab) ,. 1
NB. two such segments provide necessary linear system.
segi2d=: [: , (%. @: ,:&([:|.1 _1*-/)) +/ .* ,:&(-/ .*)
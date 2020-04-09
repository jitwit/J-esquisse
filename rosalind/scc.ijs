
find=: 4 : '{&y ^: a: x'

g=: ". ;._2 rosalind 'cc'
eg=: _2 ]\ 12 13 1 2 1 5 5 9 5 10 9 10 3 4 3 7 3 8 4 8 7 11 8 11 11 12 8 12

SCC=: 3 : 0
sccs=.vs=. i.>:{.,y
for_e. (,|."1),~}. y do.
  reps=. ~.;{&sccs ^: a: e
  sccs=. (<./ reps{sccs) reps} sccs
end.
}. sccs </. vs
)

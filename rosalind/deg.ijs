EdgeList=: 3 : 0
es=. (, |."1) }. y         NB. edges. reverse to make undirected
vs=. >:i.{.,y              NB. vertices
G=. a:,~({."1 </. {:"1) es NB. key on sources of edges
G {~ (vs i.~ ~. {."1 es)   NB. sort so that V[i] has out edges of node i
)

Degrees=: [: > # &.> @ EdgeList

DoubleDegrees=: 3 : 0
G =. EdgeList y
D =. 0, > # &.> G    NB. 0 prepended for indexing reasons
> ([: +/ {&D) &.> G
)

SCC=: 3 : 0
sccs=.vs=. i.>:{.,y
for_e. /:~ /:~"1 }. y do.
  sccs=. (<./ e{sccs) e} sccs 
end. }. sccs </. vs
)

Components =: # @ SCC

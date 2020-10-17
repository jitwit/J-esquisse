NB. basic graph stuff

bfs =: 4 : 0
NB. get tree from bfs starting at x in graph y
Q =. ~.,x NB. seed queue from x and mark x explored
S =. -. (T =. i.#y) e. x NB. explored v iff 0 = v{S
while. #Q do. 'u Q' =. ({.;}.) Q NB. pop Q
  vs =. I. S * u{y NB. unexplored out edges u -> v
  Q =. vs ,~ Q NB. push vs
  S =. 0 vs} S NB. mark vs explored
  T =. u vs} T NB. indicate parent in tree T
end. T
)

dfs =: 4 : 0
NB. get tree from dfs starting at x in graph y
Q =. ~.,x NB. seed queue from x and mark x explored
S =. 1 + 0 * (T =. i.#y) NB. explored v iff 0 = v{S
while. #Q do. 'u Q' =. ({:;}:) Q NB. pop Q
  if. u{S do. S =. 0 u} S NB. if u unexplored:
    vs =. I. S * u{y NB. unexplored edges u -> v
    Q =. vs ,~ Q NB. push vs
    T =. u vs} T NB. indicate parent in tree T
  end.
end. T
)

tsort =: 3 : 0
NB. get topological ordering on vertices
V =. 0 {. Q =. i.-#y NB. seed queue Q of all vertices and order V of none.
S =. 1 + 0 * (T =. i.#y) NB. explored v iff 0 = v{S
while. #Q do. 'u Q' =. ({.;}.) Q NB. pop Q
  if. u{S do. S =. 0 u} S NB. if u unexplored:
    vs =. I. S * u{y NB. unexplored edges u -> v
    Q =. vs , Q NB. push vs
    T =. u vs} T NB. indicate parent in tree T
  end.
end. T
)

J =: ,~ $ 1: NB. totally saturated graph
I =: =@i.    NB. identity matrix
K =: 1 - I   NB. complete graph
U =: +. |: NB. directed -> undirected
path =: 1 |.!.0 I
circ =: 1 |. I

rg =: 0.1 > ?. 1000 1000 $ 0
6!:2 '0 dfs rg'

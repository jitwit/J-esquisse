
kmptab=: monad define
kmp=. j#~n=.#y[j=.0
for_s. }.y do. 
  while. (0<j)*.-.s=j{y do. j=. (<:j){kmp end.
  if. s=j{y do. j=. >:j end.
  kmp=. j (>:s_index)} kmp
end. kmp
)

NB. (i.21) , 0 0 0 1 2 0 0 0 0 0 0 1 2 1 2 3 4 5 3 0 0 ,: FS 'CAGCATGGTATCACAGCAGAG'

NB. unrooted tree. any tree has n-1 edges.
NB. rooted has internal node with degree 2
NB. unrooted has all internal nodes degree 3
NB. sum of degree of tree is...
NB. leaves have 1. internal have 3
NB. 

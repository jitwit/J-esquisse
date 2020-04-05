kmptab=: monad define
kmp=. j#~n=.#y[j=.0
for_s. }.y do. 
  while. (0<j)*.-.s=j{y do. j=. (<:j){kmp end.
  if. s=j{y do. j=. >:j end.
  kmp=. j (>:s_index)} kmp
end. kmp
)

kmp 0 1 {:: fasta example''
NB. (i.21) , 0 0 0 1 2 0 0 0 0 0 0 1 2 1 2 3 4 5 3 0 0 ,: FS 'CAGCATGGTATCACAGCAGAG'


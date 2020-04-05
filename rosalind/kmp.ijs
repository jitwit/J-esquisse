

NB. calculate kmp of string
NB. kmp[0] = 0
NB. kmp[j] = 1+kmp[j-1] if s[j] = s[1+kmp[j-1]] otherwise, find another ix

FS=: monad define
kmp=. 0#~n=.#y
tab=. ~. y
ixs=.(<@I.)"1=y
for_c. }.y do.
  prev=. c_index{kmp
  if. c = prev{y do.
    kmp=. (>:prev) (>:c_index)} kmp
  else.
    cand=. >ixs {~ tab i. c
    pref=. c_index {. y
    for_r. >: cand {.~ prev I.~ cand do.
      echo pref;(r{.y);(-r){.pref
      if. (r{.y)-:(-r){.pref do.
        echo 'hihi'
        kmp =. r(>:c_index)}kmp
        break.
      end.
    end.
  end.
end. kmp  
)

(i.21) , 0 0 0 1 2 0 0 0 0 0 0 1 2 1 2 3 4 5 3 0 0 ,: FS 'CAGCATGGTATCACAGCAGAG'


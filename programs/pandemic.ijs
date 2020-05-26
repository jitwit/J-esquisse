require 'plot'

sim=: adverb define
p=. x
for. i.y do. p=. p,u{:p end. p
)

dis=: dyad define
'b g'=. x NB. infection rate, death rate
's i'=. y NB. succeptible, infected
ds=. (b*s*i)%(i+s)
(s-ds) , i+ds-g*i
)

pan=: 0.01 0.001&dis

run=: verb define
plot |: (,:999 11) (0.024 0.006&dis sim) 1000
)

cutoff=: 10000

simu=: dyad define
t=. 0
s=. 1 - ]i=. 0.00001
while. (1e_5 < s+i) *. (t < cutoff) do.
  t=. >:t
  ds=. (x*s*i)%(i+s)
  i=. i+ds-y*i
  s=. s-ds
end. t
)

runit=: dyad define
b=. y
g=. x-y
b;g;b simu g
)

iota=: dyad define
'a b'=. y
a + (b-a) * ((%~ i.) x)
)

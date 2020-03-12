NB. 100 prisoners puzzle
cards=: monad : '?~ 100'

NB. game is solvable by optimal strategy when the length (#) of the
NB. longest (>./) cycle (C.) is at most 50.
opt=: 50 >: [: >./ [: > [: #&.> C.

NB. for each prisoner randomly open 50 boxes and see if the right card
NB. is there.
rand=: monad define
for_p. i.100 do. if. -.p e.(50?100){y do. 0 return. end.
end. 1
)

NB. use both strategies on the same shuffles y times.
simulate=: monad define
'o r'=. +/ ((rand,opt)@?~)"0 y # 100
('strategy';'win rate (n=',(":y),')'),('random';(":100*o%y),'%'),:'optimal';(":100*r%y),'%'
)

NB. simulate 10000000
NB. ┌────────┬─────────────────────┐
NB. │strategy│win rate (n=10000000)│
NB. ├────────┼─────────────────────┤
NB. │random  │0%                   │
NB. ├────────┼─────────────────────┤
NB. │optimal │31.1816%             │
NB. └────────┴─────────────────────┘
   
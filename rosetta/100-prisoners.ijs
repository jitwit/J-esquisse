opt=: 50 >: [: >./ [: > [: #&.> C.

rand=: monad define
for_p. i.100 do. if. -.p e.(50?100){y do. 0 return. end.
end. 1
)

simulate=: monad define
'o r'=. y %~ 100 * +/ ((rand,opt)@?~)"0 y # 100
('strategy';'win rate'),('random';(":o),'%'),:'optimal';(":r),'%'
)

NB. y by y grid with x grains of sand in center
require 'viewmat'
coinsert 'jviewmat jgl2'

NB. grids
grid=: 4 : 'x (<<.-:2$y)} (2$y)$0'

gd=: grid&5

NB. implementation
R=:(,-)(,:|.)0 1
I=:+[:(_4&*+[:+/R|.!.0])3&<
S=:I^:_

s=:(+[:(_4&*+[:+/((,-)(,:|.)0 1)|.!.0])3&<)
s ^:_ gd 100

NB. visual
grains=: 4000
size=: 51
NB. color(t) = a + b ⋅ cos[ 2π(c⋅t+d)]
pala=: 0.5 0.5 0.5
palb=: 0.5 0.5 0.5
palc=: 1.0 1.0 1.0
pald =: 0 0.33 0.67

palette =: 3 : '<. 255 * 1 <. 0 >. pala + palb * 2 o. 2p1 * pald + palc * y'"0

palt=: palette (255 %~ i. 256)
world =: grains grid size
dt=: 1

bunker_form =: 0 : 0
pc bunker closeok; pn "abelian bunker";
bin h;
  minwh 600 600; cc G isidraw;
  bin v;
    cc pause button; set pause caption pause;
    cc play button; set play caption play;
    cc reset button; set reset caption reset;
    cc step button; set step caption step;
    cc btime edit; set btime wh 80 20; set btime text 1;
    cc bgrains edit; set bgrains wh 80 20; set bgrains text 4000;
    cc bsize edit; set bsize wh 80 20; set bsize text 51;
  bin z;
bin z;
pshow;
)

setup=: 3 : 0
wd bunker_form
wd'timer ',":dt
)

paint=: 3 : 0
wd 'psel bunker'
palt viewmatcc world;'G'
glpaint ''
)

update=: 3 : 0
world =: s world
)

iterate=: paint@update

pause=: 3 : 0
wd 'timer 0'
)

play=: 3 : 0
wd 'timer ',":dt
)

reset=: 3 : 0
world=: grains grid size
NB. palt=: ? (grains , 3) $ 255
step ''
)

step=: 3 : 0
world=: s world
paint ''
)

bunker_close =: 3 : 0
wd 'psel bunker; pclose; timer 0'
)

bunker_pause_button=: pause
bunker_play_button=: play
bunker_reset_button=: reset
bunker_step_button=: step
bunker_bgrains_button=: 3 : 0
grains=: ". wd 'psel bunker; get bgrains text'
reset''
)
bunker_bsize_button=: 3 : 0
size=: ". wd 'psel bunker; get bsize text'
reset''
)
bunker_btime_button=: 3 : 0
wd 'timer ',": dt=: ". wd 'psel bunker; get btime text'
)

sys_timer_z_=: iterate_base_

courir =: 3 : 0
if. IFQT do. bunker_close ^: (wdisparent'bunker') ''
    	     setup ''
end.
)

courir''

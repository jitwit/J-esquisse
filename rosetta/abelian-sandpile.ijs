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
grains=: 20000
size=: 201
palt=: ? (grains , 3) $ 255
world =: grains grid size
dt=: 1

bunker_form =: 0 : 0
pc bunker closeok; pn "abelian bunker";
bin h;
  minwh 400 400; cc G isidraw;
  bin v;
    cc pause button; set pause caption pause;
    cc play button; set play caption play;
    cc reset button; set reset caption reset;
    cc step button; set step caption step;
    cc grains edit; set grains wh 80 20; set grains text 1000;
    cc size edit; set size wh 80 20; set size text 201;
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
wd 'timer 0'
world=: grains grid size
palt=: ? (grains , 3) $ 255
wd 'timer 0'
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
bunker_grains_button=: 3 : 0
wd 'psel bunker'
echo grains=: ". wd 'get grains text'
reset''
)
bunker_size_button=: 3 : 0
wd 'psel bunker'
echo size=: ". wd 'get size text'
reset''
)

sys_timer_z_=: iterate_base_
bunker_close ^: (wdisparent'bunker') ''
setup ''

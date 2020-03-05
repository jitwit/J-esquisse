clear''
require'viewmat'
coinsert'jviewmat jgl2'

nabla2=: (1 0)&|.+(0 1)&|.+(_1 0)&|.+(0 _1)&|.-4:*]

NB. pal=: 
palette=: 2 3 $ 40 0 0 0 98 187
k=: 0.2
img=: ? 400 580 $ 0

HEQ=: noun define
pc heq;
minwh 400 420;
bin v;
  bin h;
    cc alpha edit;
      set alpha wh 50 20;
      set alpha text "0.15";
    cc dte edit;
      set dte wh 50 20;
      set dte text "1";
    cc run button;
      set run wh 50 40;
      set run caption "go!";
  bin z;
  cc screen isidraw;
  set screen wh 400 400;
bin z;
timer 0;
pshow;
)

heq_close=: verb define
wd'psel heq; pclose; timer 0'
)

heq_run_button=: verb define
wd'psel heq'
'pixw pixh'=. glqwh''
k=: ". wd 'get alpha text'
wd'timer ',wd 'get dte text'
D=: k * nabla2
img=: ? (pixw , pixh) $ 0
)

evolve=: verb define
img=: img + k * nabla2 img
)

heq_screen_mmove=: verb define
'mx my w h'=. 4 {. 0 ". sysdata
img=:(10>.(<my,mx){img) (<my,mx)} img
)

render=: verb define
wd'psel heq'
glpaint palette viewmatcc img;'screen'
)

step=: render @ evolve

sys_timer_z_ =: step_base_

NB. MUSH!
heq_mush=: verb define
if. IFQT do.
  heq_close^:(wdisparent'heq')''
  wd HEQ
  glclear''
  glfill 0 0 0 0
  glpaint''
else.
  echo'hello, emacs'
end.
)

heq_mush''

clear''
require'viewmat'
coinsert'jgl2 jviewmat'

source=: 50
rod=: source * ^&1.5 ?. 1000#0
pal=: 2 3 $ 40 0 0 0 98 187
img=: 0$0
k=: 0.15
D=: k * +: -~ _1&|. + 1&|.

HEQ=: noun define
pc heq;
minwh 400 600;
bin v;
  bin h;
    cc alpha edit;
      set alpha wh 50 20;
      set alpha text "0.15";
    cc run button;
      set run wh 50 40;
      set run caption "go!";
  bin z;
  cc screen isidraw;
  set screen wh 400 580;
bin z;
pshow;
)

heq_close=: verb define
wd'psel heq; pclose; timer 0'
)

heq_run_button=: verb define
wd'psel heq'
'pixw pixh'=. glqwh''
k=: ". wd 'get alpha text'
D=: k * +: -~ _1&|. + 1&|.
rod=: source * ^&1.5 ? pixw#0
img=: (+D) ^: (50+i.pixh) rod
img=: (-i.#img) |."0 _1 img
glsel'screen'
glclear''
glpaint pal viewmatcc (img;'screen')
)

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
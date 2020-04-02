NB. N{P}[ST]{P}  --  N-glycolisation motif. [] = or, {} = not
NglycPat=: 'N[^P](S|T)[^P]'

B5ZC00=: >{:, fasta example''
LocateMotif=: [: >: [: I. 4 NglycPat&rxeq\] NB. slower, but catches overlaps (previously, nglyc&rxmatches)
solve=: (;[:<([:LocateMotif>@{:@,)@:read_protein)
NB. QM=: [:LocateMotif[:>[:{:[:, read_protein

MOO=: monad define NB. overlaps... redirects...
retrieve'mprt'
ferase 'out.txt'
for_p. (#~([:-.a:-:{:)"1) solve ;._2 rosalind'mprt' do.
  'id locs'=. p
  if. 0<#,locs do.
    (id,LF) 1!:3<'out.txt'
    (LF,~":locs) 1!:3<'out.txt'
  end.
end.
)

substrings=: a:-.~[:,/ (<\~ }.@i.@#)
SS=: [: ; ([:<<\)\.
SUF=: (,@:(/:~ <\.)) &.>

LCS=: [: ([:>./[:(#;._1) 0,])/.&.:|. =/
slow=: monad define
base=. >{.y
bound=.>./base LCS>]comp=.({~?@#)]rest=.}.y
for_j. 1+i.-bound do.
  for_s. j<\base do.
    if. *./ >([: +./ (>s)&E.) &.> rest do. s return. end.
  end.
end.
)

LGIS=: [: ~. [: <./\. (#~ ([: =/ (,: >./\.) @ SEQ))
LGDS=: LGIS &.: -
NB. approaching...
NB. choose first longest possible number as early as possible?
NB. (,: ([: =/ (,: >./\.) @ SEQ)) 5 1 2 0 4 2 3 9
SEQ=: monad define
d=.0#~]n=.#y
g=. (>:i.n) (+&.>) ([:<[:I. {. < }.)\. y 
for_v. i.-n do.
  d=. (>: >./ 0,(v{::g){d) v} d
end. d
)


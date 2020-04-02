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

NB. lcs will be prefix of all suffixes.
NB. plan: calculate suffixes for all strands
NB.       sort each of them
NB.       look at one string, find first suffix that is prefix of all.
NB.       find length of longest exact match.
NB. too slow
LCS=: monad define NB. brutish first draft
y
)
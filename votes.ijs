NB. not deserving of a script file, but hey, calculate share of votes
NB. that remain needed win at final tally.

NB. let y = a,b be percentages of current votes x = p of two leading
NB. parties. a+b <= 1 and p <= 1. want to know what portion of q = 1 -
NB. p is needed for a >= b, by normalizing (%+/) y to ignore third
NB. party/write-in votes.
V =: -.@[ %~ 0.5 - (*(%+/))

NB. from around noon november 4
sts =: ;:'PA    AZ    NV    GA    WI    MI    FL    OH'
eot =:    0.64  0.84  0.67  0.95  0.95  0.96  0.96  0.94
cvd =:    0.454 0.51  0.492 0.485 0.496 0.497 0.478 0.452
cvr =:    0.535 0.476 0.486 0.503 0.489 0.488 0.512 0.534
grd =: /: cal =: eot V"0 1 cvd ,. cvr
('ST';'joe      don') ,: (>sts) (; & (grd&{)) cal

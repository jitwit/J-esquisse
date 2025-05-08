NB. suits, ranks, cards (lowest to highest)
S=: u: 16b2660 + i._4  NB. '♣♢♡♠'
R=: '23456789TJQKA'    NB. portable bridge notation has T for 10
C=: , S <@,"0/ R       NB. |2♣|3♣| ... |K♠|A♠|

NB. convert card numbers (0-51) to boxed strings
suits=: S {~ <. @ %&13
ranks=: R {~ 13&|
cards=: {&C

NB. bridge diagram (each suit followed by its descending ranks)
bridge=: (|.S)&(>@[ ;"0 1 (=/ suits) # (] ranks))@\:~"1

cards ]h=: 4 13 $ ?.~52  NB. show hands as dealt
bridge h  NB. show hands as bridge diagram
(\:~) {. h
ranks {.h
{.h
bridge

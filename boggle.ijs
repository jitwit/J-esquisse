NB. coclass 'gobble'
init=: 3 : 0
(9!:43) 0
N=: # WORDS=: {."1  DICTIONARY=: ([: <;._1 (9{a.)&,);._2 (1!:1) < './data/definitions.txt'
PREFX=: /:~ ~. ; <\ &.> WORDS
NB. look up definitions, prefixes, exact matches
define=: DICTIONARY {~ WORDS I. <@toupper
prefix=: -: [: {&PREFX PREFX&I.
exact=: -: [: {&WORDS WORDS&I.
'ok'
)

NB. roll some boggle dice
dice4=: _6]\'NAEAEGEGNWEHCSOAHPLVERDYTOATOWPKAFFSHRVTWEHQUMNIEITSSORLTYETTITSYDLXEDIRTOIMCUBAOBOJNLNHZRENSIEU'
roll=: ({~?~@#) {"0 1~ [: ? #"1
NB. score by indexing into score array by word length
score_word=: 0 0 0 1 1 2 3 5 11{~8<.#
view_board=: -@%:@#<"0\]

NB. take i. x y board and list graph as array with box
reify_grid=: [:-.&_1&.>[:,[:<"_2[:,"_2/(0 0-.~,/,"0/~i:1)|.!._1]
board_graph =: reify_grid i. 4 4

fill_word =: (]`(('Q';'QU')&stringreplace)@.('Q'&e.)) @: {

NB. x is board, y is single path expand based on board graph, dropping
NB. squares that have been used or are not valid prefixes
expand_path=: 4 : 0
  (#~ (prefix@<@(fill_word&x))"1) y,"_ 0/ y -.~ ({:y) {:: board_graph
)

NB. expand a list of paths of the same length and raze. outer box is
NB. to be able to ^: a: without rows of 0s.
expand_paths =: ([: < [: ; [ <@expand_path"_ 1 >@])`]@.(0=(*/) @ $@>@])

NB. solve a boggle board by starting with a path at each square and
NB. continually expanding valid paths until no further expansion is
NB. possible. Finally, copy the exact matches and present after
NB. sorting.
boggle =: 3 : 0
  candidates =. (y&expand_paths) ^: a: < ,:"0 i. # y
  matches =. ; (<@(fill_word&y))"1 &.> candidates
  (/: #&>) /:~ ~. (#~ exact"0) matches
)

init''
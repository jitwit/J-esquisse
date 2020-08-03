init_done=: 0
init=: 3 : 0
(9!:43) 0
N=: # WORDS=: {."1  DICTIONARY=: ([: <;._1 (9{a.)&,);._2 (1!:1) < './data/definitions.txt'
PREFX=: /:~ ~. ; <\ &.> WORDS
NB. look up definitions, prefixes, exact matches
define=: DICTIONARY {~ WORDS I. <@toupper
prefix=: prefix_in&PREFX
exact=: -: [: {&WORDS WORDS&I.
egg =: 'RWEAUIAEOTNBTNWS'
init_done=: 1
'ok'
)

prefix_in=: [ = ] {~ I.~
init ^: 1 ''

shake=: ({~?~@#) {"0 1~ [: ? #"1
dice4=: _6]\'NAEAEGEGNWEHCSOAHPLVERDYTOATOWPKAFFSHRVTWEHQUMNIEITSSORLTYETTITSYDLXEDIRTOIMCUBAOBOJNLNHZRENSIEU'
score=: 0 0 0 1 1 2 3 5 11{~8<.# NB. score: index by word length
view_board=: -@%:@#<"0\]
reify_grid=: [:-.&_1&.>[:,[:<"_2[:,"_2/(0 0-.~,/,"0/~i:1)|.!._1]
BOG =: reify_grid i. 4 4
sub_Q =: ('Q';'QU')&stringreplace^:('Q'&e.)
letters =: 1 : '(<@sub_Q)"1 @ ({&u)'
expand_path=: 1 : '< (#~ prefix @ (u letters)) y,"_ 0/ y -.~ ({:y) {:: BOG'
expand =: 1 : '([: < [: ; u expand_path"1 @ >) ^: (0 < (*/) @ $@>@]) y'
boggle =: 3 : 0
  (/: #&>) /:~ ~. (#~ exact"0) ; y letters"1 &.> y expand ^: a: < ,:"0 i. # y
)

test =: 3 : 0
assert. 24 = +/ score & > boggle 'DEMODEMODEMODEMO'
assert. 1254 = # boggle 'PSLMEAIARNTRGESO'
'aok'
)

test''

load'stats/base stats/distribs plot'
odds =: +/ @: %

NB. house edge from an array of decimal odds
HE =: _1 + odds



% (%+/) &.: % 2.75 7
(%+/) % 2.65 7.5

+/ % 1.4 3
+/ % 1.36 3.2

+/ % 2.35 2.75 6.75 7

+/ % 1.95 4.1 4.1 9
+/ % 3.25 3.8 7 8.25 9.25 9.75 19.5 21

q=:-.p=:%3

NB. nvm! YOLO VEGAS
co_sc =: 2.35 2.75
_1100 + co_sc * 1100 * (,-.) (+/ %~ {:) co_sc NB. equal either way
_1100 + 600 500 * co_sc
_1100 + 700 400 * co_sc
_1100 + 1100 0 * co_sc
_1100 + 1100 * 6.75
1100 * 2

NB. nba
HE 1.8 2.05
HE 2.15 1.72

NB. mlb
HE 1.87 1.91
HE 2.25 1.67
HE 2.5 1.55
HE 1.91 1.91
HE 2.25 1.65


+/ 0.8 > ?110#0
1.683 * %: 5500*50
2 * qnorm 0.8

(%~-.) 1%1.5

*/(4!24),0.5^4 20

(,.|.%+/) 1.53 2.54

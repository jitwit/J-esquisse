NB. some notes on pitch probabilities

load 'plot viewmat stats/base stats/distribs'

NB. assume we bid a suit with x such cards. Then, there are 16-x
NB. relevant cards left, 45 total cards, and we draw 6-x. Therefore,
NB. the number of cards expected to hold can be modelled with an
NB. hypergemetric distribution.
mu =: {{ y + 1r45 * */ 16.0 6 - y }}"0

NB. u is N, v is K, x is n, y is k
hpmf =: {{ (y!v) * ((x-y)!u-v) % x!u }}
0.3968253968253968 = 5 (10 hpmf 5) 2
0.017857142857142856 = 3 (8 hpmf 3) 3

NB. there are 16 cards in play, 45=54-9 total cards outside of
NB. hand. the deck is left with 18 from which players draw. given x
NB. bid relevant cards, 16-x are left. if there are y relevant cards
NB. among the 27 dealt to other players, they will draw 18-y out of
NB. the deck, while there are 16-x-y left that are relevant. how many
NB. does the deck player expect to pick up? this remaining portion is
NB. distributed as a hypergeometric(18,16-x-y,y)...

NB. probability of y relevant cards among the 27 dealt to others,
NB. given x dealt ot self.
pd =: {{ 27 (45 hpmf (16-x)) y }}

NB. expected number in remaining cards, after x+y relevant cards dealt
edd =: {{ y*(16-x+y)%18 }}

NB. need better name, but expected hand size given initial holding of
NB. x relevant cards.
ed =: {{ +/ (y + y edd ys) * y&pd ys=. i. 0>.1+16-y }}"0

NB. next, to calculate the expected size of your hand if you are not
NB. drawing from the deck. after that, the expected size of the person
NB. who has the deck but did not declare.

NB. here, you know that you have y relevant cards. you get to draw 6-y
NB. cards from the remaining 45 cards, of which 16-y are relevant.
end =: {{ y+(0>.6-y)*(16-y)%45 }}

NB. probability of y relevant cards among the 18 dealt to others,
NB. given x dealt ot self.
ppd =: {{ 18 (45 hpmf (16-x)) y }}

NB. expected number in remaining cards. x+y observed relevant, 18-x+y
NB. drawn from 9+18-x+y undealt cards.
epdd =: {{ (9+x+y)*(16-x+y)%27 }}

NB. expected number of cards piked up for each possible
epd =: {{ +/ (y epdd ys) * y&ppd ys=. i. 0>.1+16-y }}"0

NB. table demonstrating the expected pickup for all possible values,
NB. assuming you draw from the deck.
(,.ed) i.10

NB. table demonstrating the expected pickup for all possible values,
NB. assuming you do not draw from the deck.
(,.end) i.7

NB. NB!!! slight error here, negative issue likely. negligible though.
(,.epd) i.7

NB. variance next?
NB. X~H(N,K,n) has Var(X) = n (K/N) (N-K)/N (N-n)/(N-1)

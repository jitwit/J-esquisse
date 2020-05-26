
NB. Calculate odds of various outcomes in game of risk

odom=: #: i.@(*/)
a32=: (-. (<./))"1 odom 6 6 6
d22=: odom 6 6
a31=: >./"1 odom 6 6 6

roll=: 4 : 0
n=. x (<./ & #) y
+/ <: +: x (> & (n&{. @ \:~)) y
)

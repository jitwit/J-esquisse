
screen=: 14 NB. inches
res=: 1920 1080
wh=: res * screen % +/ &.: *: res
]dpi=: %: res % & (*/) wh
report_gc =: 0&({::),LF,[:(":!.8)100*[:gc_con 1&({::)
max_gc=: report_gc@({~[:(i.>./)([:gc_con 1&{::)"1)

max_gc]in=: ((>@{.);(LF-.~[:;}.))"1 ;: ;._1 (1!:1)<'rosalind_gc.txt'
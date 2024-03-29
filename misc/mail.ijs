coclass 'mail'

require'plot web/gethttp arc/zlib regex'
coinsert'jregex'

lists=: ;: 'programming general beta chat'

gzurlp=. '([-[:alnum:]]+.){2,2}gz'

NB. for forum y, store file containing links to gzipped text data
fetch_urls_gz=: 3 : 0
url=. 'http://www.jsoftware.com/pipermail/',y
links =. > ((url,'/')&,) &.> gzurlp rxall gethttp url,'/index.html'
links 1!:2 < 'data/archives/',y,'-urls'
)

NB. read file from fetch_urls_gz and find links to gzipped files
urls_gz=: 3 : 0
in=. 'data/archives/',y,'-urls'
if. -. fexist in do. fetch_urls_gz y end.
1!:1 < in
)

NB. download the links from a mailing list
request_list=: [: request_month;._2 urls_gz

NB. when dling a month, make sure it's not already here
request_month=: 3 : 0
'list month' =. _2 {. <;._1 '/', url=. y -. ' '
(1!:5 :: 0:) < dir=. 'data/archives/',list
out=. dir,'/',month
NB. ensure not already downloaded or decompressed
if. -. +./ fexist &> out;_3}.out
do. ('-o ',out) gethttp url end.
)

NB. list files downloaded from list
downloaded=: 3 : 0
1 dir 'data/archives/',y
)

NB. use gzip to decompress downloaded files
decompress=: 3 : 0
gzed=. 'gz' -: > {: <;._1 '.',y
2!:0 ^: gzed 'gzip -d ',y
)

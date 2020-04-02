require'web/gethttp' NB. rosalind utilities for downloading and managing inputs/outputs

retrieve=: monad define
assert_rosalind ''
for_r. 1 dir '~/Downloads/rosalind*.txt' do.
  r fcopynew~]to=.'data/',1{::fpathname]r=.>r
  assert. 1 = ferase r
  echo 'retrieved: ',to
end.
)

rosalind=: monad define
target=. 'data/rosalind_',y,'.txt'
assert_rosalind ''
1!:1<target
)

example=: monad define
1!:1 < 'in.txt'
)

outputs=: fwrites&'out.txt'

assert_rosalind=: monad define
assert. 'rosalind' -: 1{::fpathname jcwdpath''
'ok'
)

unitprot_dl=: monad define
assert. 6<:#y
url=. 'https://www.uniprot.org/uniprot/',(6{.y),'.fasta'
out=. 'data/protein/',(6{.y),'.fasta'
assert_rosalind ''
('-o ',out) gethttp url
)

read_protein=: monad define
assert. 6<:#y
in=. 'data/protein/',(6{.y),'.fasta'
assert_rosalind ''
unitprot_dl ^: (-.fexist in) y
fasta 1!:1 < in
)

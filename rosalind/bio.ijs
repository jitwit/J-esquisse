NB. parse argument string in fasta to boxed table
fasta=: ([:({. , [:<[:; }.) [:<;._2 ,&LF) ;._1
NB. [: (>@{.;LF-.~[:;}.)"1 ;:

retrieve=: monad define
assert. 'rosalind' -: 1{::fpathname jcwdpath''
for_r. 1 dir '~/Downloads/rosalind*.txt' do.
  r fcopynew~]to=.'data/',1{::fpathname]r=.>r
  assert. 1 = ferase r
  echo 'retrieved: ',to
end.
)

rosalind=: monad define
target=. 'data/rosalind_',y,'.txt'
assert. 'rosalind' -: 1{::fpathname jcwdpath''
1!:1<target
)
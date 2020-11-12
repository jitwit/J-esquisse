jfiles =: 1!:1 &.> <"0 {."1 dirtree '~/.guix-profile/share/j/addons/*.ijs'
jtoks =: ;: ; ,&LF &.> jfiles
jtoks =: \:~ (#;{.)/.~ jtoks
toks =: {:"1 jtoks
freqs =: {."1 jtoks
comp =: {{ ixs =. I. toks =/~ y =. ;: y
     	   fqs =. ,. ixs {:: freqs
	   (,:;:'tok freq rank') , (>y) ; fqs ; ixs }}

comp 'e. = i. I. E.'
comp 'coclass coinsert load require conew clear'
comp '/: \:'

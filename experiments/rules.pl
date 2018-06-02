rule(s,[np,vp]).
rule(np,[d,n]).
rule(np,[np,conj,np]).
rule(vp,[v,np]).
rule(vp,[v,np,pp]).
rule(pp,[p,np]).
rule(d,[]).

% Lexicon
word(d,the).
word(d,all).
word(d,every).

word(p,near).

word(conj,and).

word(n,dog).
word(n,dogs).
word(n,cats).
word(n,cat).
word(n,elephant).
word(n,elephants).

word(v,chase).
word(v,chases).
word(v,see).
word(v,sees).
word(v,amuse).
word(v,amuses).

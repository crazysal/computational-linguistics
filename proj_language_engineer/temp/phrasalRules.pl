

% Yes-no question

rule(Y,[whpr(X^Y),vp(X,[])]).
rule(ynq(Y),[aux,np(X^Y),vp(X,[])]).
rule(Z,[whpr((X^Y)^Z),inv_s(Y,[X])]).
rule(inv_s(Y,[WH]),[aux, np(X^Y),vp(X,[WH])]).

 

% be rules

rule(ynq(Y),[be,np(X^Y),pp(X,[])]).
/*for handling is there X ; where X is NP  => Always let sunflower be*/
rule(ynq(Y),[be,np((_^sunflower(sunflower))^Y)]).
rule(be,[be,vacuoth]).

 

 

% adverbs

rule(adv(X),[aux,adv(X)]).

% sentence rules

rule(s(Y,WH),[np(X^Y),vp(X,WH)]).

% np rules

rule(np(Y),[dt(X^Y),n(X)]).

rule(np(X),[pn(X)]).

rule(np(A^B),[adj(A^C),pp(C^B)]).

 

% rule to handle NP -> N. Add a some determiner

rule(np((X^Y)^exists(X,and(P,Y))),[n(X^P)]).

% n rules  

rule(n(X^Z),[n(X^Y),pp((X^Y)^Z)]).
rule(n(X),[adj(Y^X),n(Y)]).

rule(vp(X,WH),[iv(X,WH)]).
rule(vp(X^K,[]),[tv(X^Y,[]),np(Y^K)]).
rule(vp(K,[WH]),[tv(Y,[WH]),np(Y^K)]).
rule(vp(A^B,[]),[tv(A^C,[]),pp(C^B)]).
rule(vp(X^K,[]),[be(X^Y),pp(Y^K)]).
rule(vp(X),[be,pp(X)]).
rule(vp(Y,WH),[adv(X^Y),vp(X,WH)]).

% whq conversions

rule(iv(X^Z,[Y]),[tv(X^Y^Z,[])]).
rule(tv(Y^Z,[X]),[tv(X^Y^Z,[])]).

% pp rules

rule(pp(Z),[p(X^Y^Z),np(X^Y)]).
rule(pp(X),[p,np(X)]).
rule(pp(X^K,[]),[p(X^Y,[]),np(Y^K)]).

% relative clauses
rule(n(X^and(Y,Z)),[n(X^Y),rc(X^Z,[])]).
rule(n(X^and(Y,Z)),[n(X^Y),rc(Z,[X])]).

 

% relative clause

rule(rc(X,[Y]),[rel,s(X,[Y])]).

rule(rc(X,[]),[rel,vp(X,[])]).

rule(rc(Z,[X]),[rel,vp(Z,[X])]).

rule(n(X^and(Y,Z)),[n(X^Y),rc(X^Z,[])]).

rule(n(X^and(Y,Z)),[n(X^Y),rc(Z,[X])]).

%rule(rc(Z,[X]),[rel,s(Z,[X])]).

 

% vp -> dtv np pp

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np(Y^A),pp(Z^B)]).

%rule(vp(X^A^B^W,[]),[dtv(X^Y^Z^W,[]),np((X^Y)^A),pp((X^Z)^B)]).

rule(vp(X^A,[]),[dtv(X^Y^Z^W,[]),np((Y^B)^A),pp((Z^W)^B)]).

 

 
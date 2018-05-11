

% Yes-no question

rule(Y,[whpr(X^Y),vp(X,[])]).

rule(ynq(Y),[aux,np(X^Y),vp(X,[])]).

rule(Z,[whpr((X^Y)^Z),inv_s(Y,[X])]).

rule(inv_s(Y,[WH]),[aux, np(X^Y),vp(X,[WH])]).

 

% be rules

rule(ynq(Y),[be,np(X^Y),ap(X)]).

rule(ynq(Y),[be,np(X^Y),pp(X,[])]).

rule(ynq(Y),[be,np((_^fridge)^Y)]).

rule(be,[be,vacsp]).

 

 

% adverbs

rule(adv(X),[aux,adv(X)]).

 

%rule(ynq(Y),[be,np(X^Y),pp(X,[])]).

%rule(ynq(A^B),[be,np(A^C),pp(C^B)]):-write('ok').

%rule(ynq(X),[be,vacsp,np(X)]).

 

 

%rule(s(X,[]),[be,np(X^Y ),np(Z^X)]).

%rule(ynq(Y),[be,vacsp,np(X^Y),ap(X)]).

%rule(ynq(Y),[be,vacsp,np(X^Y),pp(X)]).

 

 

 

% sentence rules

rule(s(Y,WH),[np(X^Y),vp(X,WH)]).

rule(s(Y,WH),[np(X^Y),vp(X,WH)]).

%rule(s(X,[WH]),[vp(X,[WH])]).

 

 

 

 

% np rules

rule(np(Y),[dt(X^Y),n(X)]).

rule(np(X),[pn(X)]).

rule(np(A^B),[adj(A^C),pp(C^B)]).

 

% rule to handle NP -> N. Add a some determiner

%rule(np(Z),[n(X)]):-

%           lex(Y,some),

%           rule(np(Z),[Y,n(X)]).

%rule(np(exists^X),[n(X)]).

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

 

%rule(pp(A^B),[p(A^C),np(C^B)]).

%rule(pp(Z),[vacp(X^Y^Z),np(X^Y)]).

%rule(pp(Y^X),[p,np(X)]).

%rule(pp(X^K,[]),[p(X^Y,[]),np(Y^K)]).

%rule(pp((Y^X)^X),[p,np(X)]).

 

 

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

 

%rule(vp(X^A,[]),[dtv(X^Y^Z^W,[]),np(A^(Y^B)),pp(B^(Z^W))]).

 

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np((Y^B)^A),pp(Z^B)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),dvp((Y^Z)^B]).

%rule(vp(K,[]),[dtv(Y^K,[]),dvp(Y)]).

%rule(dvp(A),[np(B^A),pp(B)]).

%rule(dvp(Y^Z,[]),[dtv(X^Y^Z,[]),np(Y^Z)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np(Y^A),pp(Z^B)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np((Y^Z)^A),pp(Z^B)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np((X^Y)^A),pp((A^Z)^B)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np((Y^Z)^A),pp((A^Z)^B)]).

%rule(vp(X^A^B,[]),[dtv(X^Y^Z,[]),np((Y^A)^B),pp(Z^B)]).

%rule(vp(X,[]),[dtv(X^Y^Z,[]),np(Y^Z),pp(Z)]).

% ...

 

 
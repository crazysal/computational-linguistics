
% nouns

lex(n(X^P),Word):-

    atom_concat(Lemma,_,Word),

              lemma(Lemma,n),

              P=.. [Lemma,X].

 

% proper name

lex(pn((Word^X)^X),Word):-

    lemma(Word,pn).      

 

% determiners for all     

lex(dt((X^P)^(X^Q)^forall(X,imp(P,Q))),Word):-

                             lemma(Word,dtforall).

                            

% determiners for exist

lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),Word):-

                             lemma(Word,dtexists).

 

% Determiners for the,no

lex(dt((X^P)^(X^Q)^no(X,and(P,Q))),Word):-

              lemma(Word,dtsp),

              Word=no.

 

% Determiners for the

lex(dt((X^P)^(X^Q)^the(X,and(P,Q))),Word):-

              lemma(Word,dtsp),

              Word=the.        

             

% Determiners for one

lex(dt((X^P)^(X^Q)^one(X,and(P,Q))),Word):-

              lemma(Word,one).                      

 

             

% Determiners for two

lex(dt((X^P)^(X^Q)^two(X,and(P,Q))),Word):-

              lemma(Word,two).                      

 

% Determiners for three

lex(dt((X^P)^(X^Q)^three(X,and(P,Q))),Word):-

              lemma(Word,three).                   

 

% Determiners for four

lex(dt((X^P)^(X^Q)^four(X,and(P,Q))),Word):-

              lemma(Word,four).                     

 

% Determiners for five

lex(dt((X^P)^(X^Q)^five(X,and(P,Q))),Word):-

              lemma(Word,five).                      

 

             

% numbers

lex(X^P,Word):-

    lemma(Word,Word),

    P=.. [Word,X].             

             

 

 

% intransitive verb phrase, here our lemma will be the root word                          

lex(iv(X^P,[]),Word):-

    atom_concat(Lemma,_,Word),

    lemma(Lemma,iv),

    P=.. [Lemma,X].          

             

% transitive verb

lex(tv(K^W^P,[]),Word):-

                             atom_concat(Lemma,_,Word),

                             lemma(Lemma,tv),

        P=.. [Lemma,K,W].

                            

% ditransitive verb

lex(dtv(X^Y^Z^P,[]),Word):-

                             atom_concat(Lemma,_,Word),

                             lemma(Lemma,dtv),

        P=.. [Lemma,X,Y,Z].

                                                         

                            

% adjectives

lex(adj((X^P)^X^and(P,Q)),Word):-

    lemma(Word,adj),

    Q=.. [Word,X].

 

% prepositions

lex(p((Y^Z)^Q^(X^P)^and(P,Q)),Word):-

    lemma(Word,p),

    Z=.. [Word,X,Y].          

 

% some P can act as transitive verbs       

lex(p(K^W^P,[]),Word):-

                             %atom_concat(Lemma,_,Word),

                             lemma(Word,p),

        P=.. [Word,K,W].

 

% vacous prepositions

%lex(vacp((Y^Z)^Q^(X^P)^and(P,Q)),Word):-

%    lemma(Word,vacp),

%    Z=.. [Word,X,Y].

lex(p,Word):-

    lemma(Word,vacp).

   

             

             

% aux   

lex(Y,Word):-

    lemma(Word,Y),

              Y=aux.

             

% who

lex(whpr((X^P)^q(X,and(person(X),P))),Word):-

                             lemma(Word,whprp).

lex(whpr((X^P)^q(X,and(thing(X),P))),Word):-

                             lemma(Word,whprt).

 

 

                            

% coordinates

%lex(P^Q^and(P,Q),Word):-

%    lemma(Word,coord).

 

%lex(P^Q^or(P,Q),Word):-

%    lemma(Word,coordor).

 

             

% relative clauses          

lex(Y,Word):-

    lemma(Word,Y),

              Y=rel.   

             

% be

%lex(be(K^W^P),Word):-

%                          lemma(Word,be),

%        P=.. [Word,K,W].

 

lex(Y,Word):-

    lemma(Word,Y),

              Y=be.   

             

% vacsp

lex(Y,Word):-

    lemma(Word,Y),

              Y=vacsp.

             

 

% adjective predicates

lex(ap(X^P),Word):-

    lemma(Word,ap),      

              P=.. [Word,X].

 

% adverbs         

lex(adv(X^P),Word):-

    lemma(Word,adv),

    P=.. [Word,X].             

 

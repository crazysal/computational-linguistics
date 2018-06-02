    
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
% Determiners for five
lex(dt((X^P)^(X^Q)^five(X,and(P,Q))),Word):-
  lemma(Word, six).
% Determiners for seven
lex(dt((X^P)^(X^Q)^seven(X,and(P,Q))),Word):-
  lemma(Word,seven).                      
% Determiners for eight
lex(dt((X^P)^(X^Q)^eight(X,and(P,Q))),Word):-
  lemma(Word,eight).                      
% Determiners for nine
lex(dt((X^P)^(X^Q)^nine(X,and(P,Q))),Word):-
  lemma(Word,nine).                      
% Determiners for ten
lex(dt((X^P)^(X^Q)^ten(X,and(P,Q))),Word):-
  lemma(Word,ten).                      

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
%%  atom concat to handle suffix

% transitive verb
lex(tv(M^N^P,[]),Word):-
  atom_concat(Lemma,_,Word),
  lemma(Lemma,tv),
  P=.. [Lemma,M,N].
                        

% intransitive verb phrase, here our lemma will be the root word

lex(iv(X^P,[]),Word):-
    atom_concat(Lemma,_,Word),
    lemma(Lemma,iv),
    P=.. [Lemma,X].          
% ditransitive verb - similar to transitive verbut are di - hence both  se related 
lex(dtv(M^N^O^P,[]),Word):-
  atom_concat(Lemma,_,Word),
  lemma(Lemma,dtv),
  P=.. [Lemma,M,N,O].

 
% prepositions
lex(p((Y^Z)^Q^(X^P)^and(P,Q)),Word):-
  lemma(Word,p),
  Z=.. [Word,X,Y].          
 
% adjectives
lex(adj((X^P)^X^and(P,Q)),Word):-
  lemma(Word,adj),
  Q=.. [Word,X].

% P as TV as discussed on piazza

lex(p(X^Z^P,[]),Word):-
  lemma(Word,p),
  P=.. [Word,X,Z].

% existential  determiners
lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),Word):-
  lemma(Word,dtexists).

% Determiners for the,no
lex(dt((X^P)^(X^Q)^no(X,and(P,Q))),Word):-
  lemma(Word,dtneg),
  Word=no.
 
% Determiners for the
lex(dt((X^P)^(X^Q)^the(X,and(P,Q))),Word):-
  lemma(Word,dtthe),
  Word=the.        

% aux  - same 
lex(aux,Word):-
  lemma(Word,aux).
             

             
% vacuoth - same
lex(vacuoth,Word):-
  lemma(Word,vacuoth).

% adjective predicates
lex(ap(X^P),Word):-
  lemma(Word,ap),
  P=.. [Word,X].

% adverbs         
lex(adv(X^P),Word):-
 lemma(Word,advbs),
 P=.. [Word,X].    

% rel - same         
lex(rel,Word):-
  lemma(Word,rel).


% be - same              
lex(be,Word):-
  lemma(Word,be).

% vacous prepositions - same as prepositions
lex(p,Word):-
  lemma(Word,vacp).         
         
% wh questions - as rule given in slide
lex(whpr((X^P)^q(X,and(person(X),P))),Word):-
  lemma(Word,whprperson).

lex(whpr((X^P)^q(X,and(thing(X),P))),Word):-
  lemma(Word,whprthing).

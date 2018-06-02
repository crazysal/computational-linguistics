% ==================================================
% Function i
% Determines the value of a variable/constant in an assignment G
% ==================================================

i(Var,G,Value):- 
    var(Var),
    member([Var2,Value],G), 
    Var == Var2.   

i(C,_,Value):- 
   nonvar(C),
   f(C,Value).


% ==================================================
% Function F
% Determines if a value is in the denotation of a Predicate/Relation
% ==================================================

f(Symbol,Value):- 
   model(_,F),
    member([Symbol,ListOfValues],F), 
    member(Value,ListOfValues).  
%% f(Symbol,[R]):- 
%%   f(Symbol,R). 
%% f(Symbol,[_,R]):- 
%%   f(Symbol,R). 

% ==================================================
% Extension of a variable assignment
% ==================================================

extend(G,X,[ [X,Val] | G]):-
   model(D,_),
   member(Val,D).


% ==================================================
% Existential quantifier
% ==================================================

sat(G1,exists(X,Formula),G3, Z):-
   extend(G1,X,G2),
   sat(G2,Formula,G3, Z).


sat(G1,if(X,Formula),G3, Z):-
   extend(G1,X,G2),
   sat(G2,Formula,G3, Z).


% ==================================================
% Definite quantifier (semantic rather than pragmatic account)
% ==================================================

sat(G1,the(X,and(A,B)),G3, Z):-
   sat(G1,exists(X,and(A,B)),G3, Z),
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists(X,A),G2, Z), i(X,G2,Value2), \+(Value = Value2)) ).



%% 
/*sat(G1,the(X,A),G3):-
   sat(G1,exists(X,A),G3),
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists(X,A),G2), i(X,G2,Value2), \+(Value = Value2)) ).
*/
%% 


%% sat(G1,the(X,Formula),G3):-
%%    sat(G1,exists(X,Formula),G3).

/*,
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists(X,A),G2), i(X,G2,Value2), \+(Value = Value2)) ).
*/



% ==================================================
% Negation 
% ==================================================

sat(G,not(Formula2),G, Z):-
   \+ sat(G,Formula2,_, Z).

% ==================================================
% Universal quantifier
% ==================================================

sat(G, forall(X,Formula2),G, Z):-
  sat(G,not( exists(X,not(Formula2) ) ),G, Z).


% ==================================================
% Conjunction
% ==================================================

sat(G1,and(Formula1,Formula2),G3, Z):-
  sat(G1,Formula1,G2, Z), 
  sat(G2,Formula2,G3, Z). 


% ==================================================
% Disjunction
% ==================================================


sat(G1,or(Formula1,Formula2),G2, Z):-
  ( sat(G1,Formula1,G2, Z) ;
    sat(G1,Formula2,G2, Z) ).


% ==================================================
% Implication
% ==================================================

sat(G1,imp(Formula1,Formula2),G2, Z):-
   sat(G1,or(not(Formula1),Formula2),G2, Z).


% ==================================================
% Predicates
% ==================================================

sat(G,Predicate,G, _):-
   Predicate =.. [P,Var],
   \+ (P = not),
   i(Var,G,Value),
   f(P,Value).

% ==================================================
% Two-place Relations
% ==================================================

sat(G,Rel,G, _):-
   Rel =.. [R,Var1,Var2],
   \+ ( member(R,[exists,forall,and,or,imp,the]) ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
   f(R,[Value1,Value2]).


/* Custom  Defined*/

% ==================================================
% Sentences
% ==================================================

sat(G1,s(Formula, _),G3, _):-
    sat(G1,Formula,G3, 1).


% ==================================================
% Yes No Questions
% ==================================================

sat(G2,ynq(Formula),G3, Z):-
    (sat(G2,Formula,G3, Z), Z =2;
    Z =3) .

% ==================================================
% What Questions
% ==================================================

sat(G1,q(X, Formula), G3, Z):-
    %% findall(R, sat(G1,exists(X, Formula), [[_,_],[_,R]], Z), G),
    findall(R, (sat(G1,exists(X, Formula), [_|[_,R]], Z)), G),
    %% findall(U, (sat(G1,exists(X, Formula), [_|[_|R]], Z), f(U, R)), G),
    
     Z = 4, G3 = G.
      

% ==================================================
% Every
% ==================================================

/*sat(G1,ynq(exists(X,Formula)),G3, _):-
    extend(G1,X,G2),
    sat(G2,Formula,G3, 2),
    \+ sat(G2,Formula,G3, 3).*/
      


% ==================================================
% Number
% ==================================================
sat(G1,two(X,Formula),G3, Z):-
   findall(G,(sat(G1,exists(X,Formula),G, Z)),G3),
   member(LL,G3),
   member(LLL,LL),
   write(LLL),
   length(LLL,2), 
   Z = 2.

/*
sat(G1,one(exists(X,Formula)),G3, Z):-
    extend(G1,X,G2),
    (sat(G2,Formula,G3, 2);
      ).*/



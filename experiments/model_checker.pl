% Testbed

t(1):- write('sat([],exists(X,and(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),G).'),nl,
         sat([],exists(X,and(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),G),
         nl,
      % uncommenting the numbervars/3 line maintains original variables in output, but
      % such variable names can no longer be instantiated
      % numbervars(G,0,_),
         write(G).

t(2):- write('sat([],forall(X,and(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),G).'),nl,
         sat([],forall(X,and(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),_).

t(3):- write('sat([],forall(X,imp(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),G).'),nl,
         sat([],forall(X,imp(dog(X),exists(Y,and(cat(Y),chase(X,Y))))),_).

t(4):- sat([],exists(X,imp(person(X),not(exists(Y,and(box(Y),contain(Y,X)))))),G),
        write(G).




% __________________________________________________
%
%             MODEL CHECKER (closed world assumption)
% __________________________________________________



% ==================================================
% A simple model
% ==================================================

model([a,b,c,r],
           [ [cat, [a,b]], [dog,[c]], [die, [c,r,d]], [chase, [ [a,b], [c,a], [c,b] ]] ]).
/*
Tables - {t1, t2, t3}
Boxes - {b1, b2, b3, b4}
Ham - {h1, h2}
Freezers - {f1, f2}
Milk - {m1}
Egg - {e1}
Sue - p1 
Tom - p2, drinks milk
Box 1 is blue and black, contains tables 1,2,3, and ham 1,  belongs to Tom 
Box 2 is black, contains tables 1,2,3,  belongs to Tom 
Box 3 is yellow, contains tables 1,2,3, and ham 2,  belongs to Sue 
Box 4 is white,  belongs to Sue 
Freezer 1 contains box 4
Freezer 2 contains box 1,2,3

*/
model([t1, t2, t3, b1, b2, b3, b4, h1, h2, f1, p1, p2, m1, e1],
  [
    [table,[t1, t2, t3]],
    [box,[b1, b2, b3, b4]],    
    [ham,[h1, h2]],    
    [milk,[m1]],    
    [freezer,[f1]],
    [egg, [e1]]    
    [sue,[p1]],    
    [tom,[p2]],    
    [blue, [b1]],
    [black, [b1, b2]],  
    [yellow, [b3]],
    [white, [b4]],
    [contain, [
                [b1, t1], [b1,t2], [b1,t3], [b1, h1],
                [b2, t1], [b2,t2], [b2,t3], 
                [b3, t1], [b3,t2], [b3,t3], [b3, h2],
                [f1, b4] 
              ]
    ],
    [belong, [
                [b1, p2],[b2,p2],
                [b3, p1],[b4,p1]
              ]
    ] ,
    [drink, [
               [p2, m1]
            ]
    ]  

  ]).

    %% [contain, [b2, t1]],  
    %% [contain, [b3, t1]]  
%% s(forall(_G387,if(table(_G387),exists(_G395,and(and(box(_G395),black(_G395)),contain(_G395,_G387))))))
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


% ==================================================
% Extension of a variable assignment
% ==================================================

extend(G,X,[ [X,Val] | G]):-
   model(D,_),
   member(Val,D).


% ==================================================
% Existential quantifier
% ==================================================

sat(G1,exists(X,Formula),G3):-
   extend(G1,X,G2),
   sat(G2,Formula,G3).


sat(G1,if(X,Formula),G3):-
   extend(G1,X,G2),
   sat(G2,Formula,G3).


% ==================================================
% Definite quantifier (semantic rather than pragmatic account)
% ==================================================

sat(G1,the(X,and(A,B)),G3):-
   sat(G1,exists(X,and(A,B)),G3),
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists(X,A),G2), i(X,G2,Value2), \+(Value = Value2)) ).



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

sat(G,not(Formula2),G):-
   \+ sat(G,Formula2,_).

% ==================================================
% Universal quantifier
% ==================================================

sat(G, forall(X,Formula2),G):-
  sat(G,not( exists(X,not(Formula2) ) ),G).


% ==================================================
% Conjunction
% ==================================================

sat(G1,and(Formula1,Formula2),G3):-
  sat(G1,Formula1,G2), 
  sat(G2,Formula2,G3). 


% ==================================================
% Disjunction
% ==================================================


sat(G1,or(Formula1,Formula2),G2):-
  ( sat(G1,Formula1,G2) ;
    sat(G1,Formula2,G2) ).


% ==================================================
% Implication
% ==================================================

sat(G1,imp(Formula1,Formula2),G2):-
   sat(G1,or(not(Formula1),Formula2),G2).


% ==================================================
% Predicates
% ==================================================

sat(G,Predicate,G):-
   Predicate =.. [P,Var],
   \+ (P = not),
   i(Var,G,Value),
   f(P,Value).

% ==================================================
% Two-place Relations
% ==================================================

sat(G,Rel,G):-
   Rel =.. [R,Var1,Var2],
   \+ ( member(R,[exists,forall,and,or,imp,the]) ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
   f(R,[Value1,Value2]).

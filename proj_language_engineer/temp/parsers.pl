parse(Sentence,Parse):-
        srparse([],Sentence,Parse).
        
srparse([X],[],X).

srparse([Z,Y,X|MoreStack],Words,Parse):-
       rule(LHS,[X,Y,Z]),
       srparse([LHS|MoreStack],Words,Parse). 

srparse([Y,X|MoreStack],Words,Parse):-
       rule(LHS,[X,Y]),
       srparse([LHS|MoreStack],Words,Parse).

srparse([X|MoreStack],Words,Parse):-
       rule(LHS,[X]),
       srparse([LHS|MoreStack],Words,Parse).

srparse(Stack,[Word|Words],Parse):-
        lex(X,Word),
        srparse([X|Stack],Words,Parse).     

% ...
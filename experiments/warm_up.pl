contact(fred, by_email, mia,[10,5,2012]).
contact(sue, by_phone, ann,[6,4,2012]).
contact(robin, by_letter, sue,[3,5,2012]).
contact(fred, by_phone, mia,[7,2,2012]).

felon(kim).
felon(bob).
felon(fred).

detect_felon_contact(X,Y):- felon(X), contact(X,_,Y,_).


example :-
  repeat,
    write('Enter a number between 0 and 1000: '),
    read(X), 
  (X =:= 42).

% Declarative true in the model

respond(Evaluation) :-
	Evaluation = [true_in_the_model],
	nl, 
	write('That is correct'),!.

 

% Declarative false in the model

respond(Evaluation) :-
	Evaluation = [not_true_in_the_model], 
	nl, write('That is not correct, negative, out of the question, '),!.

 

% Yes-No interrogative true in the model

respond(Evaluation) :-

	Evaluation = [yes_to_question],                            
	nl, 
	write('yes').

 

% Yes-No interrogative false in the model                          

respond(Evaluation) :-
	Evaluation = [no_to_question],                              
	nl, 
	write('no siree, not on your life, thumbs down').

% wh-interrogative false in the model
respond(Evaluation) :-
	Evaluation = [],                              
	nl, 
	write('Pigs might fly : no, none, nix, nay, nah,  nothing, nada, zapat').

% wh-interrogative true in the model

respond(Evaluation) :-
	write(Evaluation).

evaluate(_, Evaluate, 0):- 
    %% write('Model Responded'), nl,
    %% write(ModelResponse),
    Evaluate = [not_true_in_the_model].

evaluate(_, Evaluate, 1):- 
    %% write('Model Responded'), nl,
    %% write(ModelResponse),
    Evaluate = [true_in_the_model].

evaluate(_, Evaluate, 2):- 
    %% write('Model Responded'), nl,
    %% write(ModelResponse),
    Evaluate = [yes_to_question].

evaluate(_, Evaluate, 3):- 
    %% write('Model Responded'), nl,
    %% write(ModelResponse),
    Evaluate = [no_to_question].

evaluate(X, Evaluate, 4):- 
	Evaluate = X.
evaluate(X, Evaluate, 4):- 
	X = [],
	Evaluate = [i_dont_know].



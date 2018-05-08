
% ===========================================================
% Main loop:
% 1. Repeat "input-response" cycle until input starts with "bye"
%    Each "input-response" cycle consists of:
% 		1.1 Reading an input string and convert it to a tokenized list
% 		1.2 Processing tokenized list
% ===========================================================

chat:-
 repeat,
   readinput(Input),
   process(Input), 
  (Input = [bye| _] ),!.
  

% ===========================================================
% Read input:
% 1. Read char string from keyboard. 
% 2. Convert char string to atom char list.
% 3. Convert char list to lower case.
% 4. Tokenize (based on spaces).
% ===========================================================

readinput(TokenList):-
   read_line_to_codes(user_input,InputString),
   string_to_atom(InputString,CharList),
   string_lower(CharList,LoweredCharList),
   tokenize_atom(LoweredCharList,TokenList).


% ===========================================================
%  Process tokenized input
% 1. Parse morphology and syntax, to obtain semantic representation
% 2. Evaluate input in the model
% If input starts with "bye" terminate.
% ===========================================================

process(Input):-
	parse(Input,SemanticRepresentation),
	modelchecker(SemanticRepresentation,Evaluation),
	respond(Evaluation),!,
	nl,nl.
	
process([bye|_]):-
   write('> bye!').


% ===========================================================
%  Parse:
% 1. Morphologically parse each token and tag it.
% 2. Add semantic representation to each tagged token
% 3. Obtain FOL representation for input sentence
% ===========================================================

%parse(Input, SemanticRepresentation):-
% ...


% ===========================================================
% Grammar
% 1. List of lemmas
% 2. Lexical items
% 3. Phrasal rules
% ===========================================================

% --------------------------------------------------------------------
% Lemmas are uninflected, except for irregular inflection
% lemma(+Lemma,+Category)
% --------------------------------------------------------------------

%% ...
lemma(a,dtexists).
lemma(an,dtexists).
lemma(some,dtexists).
%% 
lemma(each,dtforall).
lemma(all,dtforall).
lemma(every,dtforall).
%% 
lemma(the,dtthe).
%% 
lemma(box,n).
lemma(bus,n).
lemma(weapon,n).
lemma(passenger,n).
lemma(man,n).
%% 
lemma(tom,pn).
lemma(mia,pn).
lemma(sue,pn).
lemma(rui,pn).
lemma(sal,pn).
%% 
lemma(red,adj).
lemma(yellow,adj).
lemma(old,adj).
lemma(illegal,adj).
lemma(big,adj).
%% 
lemma(is,be).
lemma(was,be).
%% 
lemma(eat,tv).
lemma(saw,tv).
lemma(had,tv).
%% 
lemma(in,p).
lemma(under,p).
%% 
lemma(on,vacp).   
lemma(to,vacp).
%% 
lemma(sneeze,iv).


 
 
% --------------------------------------------------------------------
% Constructing lexical items:
% word = lemma + suffix (for "suffix" of size 0 or bigger)
% --------------------------------------------------------------------

%% lex(n(X^bus(X)),bus).
lex(n(X^P),Lemma):-
	lemma(Lemma,n),
	P=.. [Lemma,X].


%% lex(pn((sue^X)^X),sue).
lex(pn((Lemma^X)^X), Lemma):-
	lemma(Lemma,pn).



%% lex(dt((X^P)^(X^Q)^forall(X,(imp(P,Q)))),each).
lex(dt((X^P)^(X^Q)^forall(X,imp(P,Q))),Word):-
		lemma(Word,dtforall).
 

%% lex(dt((X^P)^(X^Q)^the(X,(and(P,Q)))),the).
lex(dt((X^P)^(X^Q)^the(X,and(P,Q))),Word):-
		lemma(Word,dtthe).

%% lex(dt((X^P)^(X^Q)^exists(X,(and(P,Q)))),some).
lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),Word):-
		lemma(Word,dtexists).



%% lex(p((Y^on(X,Y))^Q^(X^P)^and(P,Q)),on).
lex(p((Y^Z)^Q^(X^P)^and(P,Q)),Word):-
		lemma(Word,p),
		Z=.. [Word,X,Y].

%% lex(iv(X^sneezed(X)),sneezed).
lex(iv(X^Z),Word):-
	lemma(Word,iv),
	Z=.. [Word,X].


%% lex(tv(X^Y^saw(X,Y)),saw).
lex(tv(X^Y^P),Word):-
	lemma(Word,tv),
	P =.. [Word,X,Y].
 
%% lex(adj((X^P)^X^and(P,yellow(X))),yellow).				
lex(adj((X^P)^X^and(P,Z)),Word):-
	lemma(Word,adj),
	Z =.. [Word,X].

% ...

% --------------------------------------------------------------------
% Suffix types
% --------------------------------------------------------------------

% ...

% --------------------------------------------------------------------
% Phrasal rules
% rule(+LHS,+ListOfRHS)
% --------------------------------------------------------------------

rule(np(Y),[dt(X^Y),n(X)]).
rule(np(X),[pn(X)]).

% ...


% ===========================================================
%  Modelchecker:
%  1. If input is a declarative, check if true
%  2. If input is a yes-no question, check if true
%  3. If input is a content question, find answer
% ===========================================================

% model(...,...)

% ===========================================================
%  Respond
%  For each input type, react appropriately.
% ===========================================================

% Declarative true in the model
respond(Evaluation) :- 
		Evaluation = [true_in_the_model], 
		write('That is correct'),!.

% Declarative false in the model
respond(Evaluation) :- 
		Evaluation = [not_true_in_the_model],  
		write('That is not correct'),!.

% Yes-No interrogative true in the model
respond(Evaluation) :- 
		Evaluation = [yes_to_question],			
		write('yes').

% Yes-No interrogative false in the model		
respond(Evaluation) :- 
		Evaluation = [no_to_question], 			
		write('no').

% wh-interrogative true in the model
% ...							

% wh-interrogative false in the model
% ...							


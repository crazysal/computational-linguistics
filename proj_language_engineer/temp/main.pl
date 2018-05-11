% ===========================================================

% Main loop:

% 1. Repeat "input-response" cycle until input starts with "bye"

%    Each "input-response" cycle consists of:

%                          1.1 Reading an input string and convert it to a tokenized list

%                          1.2 Processing tokenized list

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

parse(Sentence,Parse):-

        srparse([],Sentence,Parse).

srparse([X],[],X).

  %numbervars(X,0,_),

  %write(X).

 

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
:- ['lemmaRules.pl'].
 
% --------------------------------------------------------------------

% Constructing lexical items:

% word = lemma + suffix (for "suffix" of size 0 or bigger)

% --------------------------------------------------------------------

:- ['lexicons.pl'].
% ...

 

% --------------------------------------------------------------------

% Suffix types

% --------------------------------------------------------------------

%% handeled using atom_concat, no need of explicit declarative
% ...

% --------------------------------------------------------------------

% Phrasal rules

% rule(+LHS,+ListOfRHS)

% --------------------------------------------------------------------

:- ['phrasalRules.pl'].

% ===========================================================

%  Modelchecker:

%  1. If input is a declarative, check if true

%  2. If input is a yes-no question, check if true

%  3. If input is a content question, find answer

% ===========================================================

 
:- ['modelCheckers.pl'].


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

 
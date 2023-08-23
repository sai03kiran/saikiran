% Rules
% If it's summer and it's sunny, then people are happy.
if(summer, sunny, happy).

% Facts
is_true(summer).
is_true(sunny).

% Backward Chaining
infer(Goal) :-
    is_true(Goal).
infer(Goal) :-
    if(Condition, Goal),
    infer(Condition),
    assertz(is_true(Goal)),
    write(Goal), write(' is now true.'), nl.

% Query examples
% To infer a goal based on rules and facts:
% ?- infer(happy).
%
% To see the current true facts:
% ?- is_true(X).

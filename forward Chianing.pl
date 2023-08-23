% Rules
% If it's hot, then it's summer.
if(hot, summer).

% If it's summer and it's sunny, then people are happy.
if(summer, sunny, happy).

% Facts
is_true(hot).
is_true(sunny).

% Forward Chaining
infer(X) :-
    if(X, Y),
    is_true(Y),
    \+ is_true(X),
    assertz(is_true(X)),
    write(X), write(' is now true.'), nl,
    infer(X).

% Query examples
% To infer facts based on rules and facts:
% ?- infer(happy).
%
% To see the current true facts:
% ?- is_true(X).

% Monkey is initially not holding the banana
holding_banana(false).

% Actions available to the monkey
action(grab) :-
    holding_banana(false),
    on(chair),
    at(monkey, Floor),
    at(banana, Ceiling),
    Floor = Ceiling,
    retract(holding_banana(false)),
    assertz(holding_banana(true)).

action(climb) :-
    on(Floor),
    at(monkey, Floor),
    retract(on(Floor)),
    assertz(on(chair)).

% Initial state
at(monkey, floor).
at(chair, middle).
at(banana, ceiling).
on(floor).

% Goal state
goal_state(holding_banana(true)).

% Rule to achieve the goal state
achieve_goal(State) :-
    goal_state(Goal),
    subset(Goal, State).

% Plan execution
execute_plan([]).
execute_plan([Action | Rest]) :-
    call(Action),
    execute_plan(Rest).

% Solve the problem
solve :-
    initial_state(Initial),
    solve(Initial, Plan),
    execute_plan(Plan).

solve(State, []) :-
    achieve_goal(State).
solve(State, [Action | Rest]) :-
    action(Action),
    update_state(State, Action, NewState),
    solve(NewState, Rest).

update_state(State, grab, NewState) :-
    retractall(holding_banana(_)),
    assertz(holding_banana(true)),
    NewState = [holding_banana(true) | State].
update_state(State, climb, NewState) :-
    retract(on(Floor)),
    assertz(on(chair)),
    NewState = [on(chair) | State].

% Helper predicate to check if a list is a subset of another list
subset([], _).
subset([X | Rest], List) :-
    member(X, List),
    subset(Rest, List).

% Query to solve the Monkey Banana Problem
% ?- solve.

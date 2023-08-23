% Graph representation
edge(a, b, 2).
edge(a, c, 5).
edge(b, d, 3).
edge(c, e, 4).
edge(d, f, 1).
edge(e, f, 3).

% Predicate to calculate heuristic values (distance to goal)
heuristic(Node, HeuristicValue) :-
    goal(Goal),
    edge(Node, Goal, HeuristicValue).

% Best First Search
best_first_search(Start, Path) :-
    goal(Goal),
    best_first_search([[Start]], Goal, Path).

best_first_search([[Node | Path] | _], Node, [Node | Path]).
best_first_search([[Node | _Path] | RestPaths], Goal, FinalPath) :-
    expand(Node, NewPaths),
    merge_paths(RestPaths, NewPaths, MergedPaths),
    sort_paths_by_heuristic(MergedPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath).

expand(Node, NewPaths) :-
    findall([Neighbor, Node | Path], (edge(Node, Neighbor, _), \+ member(Neighbor, [Node | Path])), NewPaths).

merge_paths(Paths1, Paths2, MergedPaths) :-
    append(Paths1, Paths2, MergedPaths).

sort_paths_by_heuristic(Paths, SortedPaths) :-
    predsort(compare_heuristic, Paths, SortedPaths).

compare_heuristic(Result, Path1, Path2) :-
    heuristic_value(Path1, H1),
    heuristic_value(Path2, H2),
    compare(Result, H1, H2).

heuristic_value([Node | _], HeuristicValue) :-
    heuristic(Node, HeuristicValue).

% Set the goal node
goal(f).

% Query example
% To find the optimal path using Best First Search:
% ?- best_first_search(a, Path).

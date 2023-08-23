% Facts about diseases and their dietary recommendations
% Replace these facts with real disease information and recommendations

% For disease X
diet_recommendation(disease_x, [
    avoid(sugar),
    increase(vegetables),
    limit(salt),
    avoid(fried-foods)
]).

% For disease Y
diet_recommendation(disease_y, [
    avoid(gluten),
    increase(fiber),
    limit(dairy),
    avoid(high-fat-foods)
]).

% Rules to suggest diet based on disease
suggest_diet(Disease) :-
    diet_recommendation(Disease, Recommendations),
    write('Diet recommendations for '), write(Disease), write(':'), nl,
    print_recommendations(Recommendations).

print_recommendations([]).
print_recommendations([avoid(Food)|Rest]) :-
    write('- Avoid '), write(Food), nl,
    print_recommendations(Rest).
print_recommendations([increase(Food)|Rest]) :-
    write('- Increase '), write(Food), nl,
    print_recommendations(Rest).
print_recommendations([limit(Food)|Rest]) :-
    write('- Limit '), write(Food), nl,
    print_recommendations(Rest).

% Query examples
% To suggest a diet for disease X:
% ?- suggest_diet(disease_x).
%
% To suggest a diet for disease Y:
% ?- suggest_diet(disease_y).

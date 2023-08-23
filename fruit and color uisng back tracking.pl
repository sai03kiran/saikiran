% Facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).

% Predicate to find the color of a fruit
color_of(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Predicate to find fruits of a particular color
fruits_of_color(Color, Fruits) :-
    findall(Fruit, fruit_color(Fruit, Color), Fruits).

% Query examples
% To find the color of a fruit:
% ?- color_of(apple, Color).
%
% To find fruits of a particular color:
% ?- fruits_of_color(red, Fruits).

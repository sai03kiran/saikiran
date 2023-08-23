% Facts about family relationships
parent(john, mary).
parent(john, james).
parent(mary, lisa).
parent(mary, david).
parent(james, emma).
parent(lisa, sarah).

% Predicate to define the mother relationship
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Predicate to define the father relationship
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% Predicate to define the sibling relationship
sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% Predicate to define the brother relationship
brother(Brother, Person) :-
    sibling(Brother, Person),
    male(Brother).

% Predicate to define the sister relationship
sister(Sister, Person) :-
    sibling(Sister, Person),
    female(Sister).

% Predicate to define the grandparent relationship
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Predicate to define the ancestor relationship
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Descendant).

% Facts about genders
male(john).
male(james).
male(david).
female(mary).
female(lisa).
female(emma).
female(sarah).

% Query examples
% To find all siblings of a person:
% ?- sibling(james, Sibling).
%
% To find all grandparents of a person:
% ?- grandparent(Grandparent, sarah).
%
% To find all ancestors of a person:
% ?- ancestor(Ancestor, sarah).

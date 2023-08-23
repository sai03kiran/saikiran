% Database of planets in our solar system
planet(mercury, 0.39, 0.24).
planet(venus, 0.72, 0.62).
planet(earth, 1, 1).
planet(mars, 1.52, 0.33).
planet(jupiter, 5.2, 317.8).
planet(saturn, 9.58, 95.2).
planet(uranus, 19.22, 14.6).
planet(neptune, 30.05, 17.2).

% Predicate to find the distance of a planet from the Sun
distance_from_sun(Planet, Distance) :-
    planet(Planet, Distance, _).

% Predicate to find the mass of a planet
planet_mass(Planet, Mass) :-
    planet(Planet, _, Mass).

% Query examples
% To find the distance of a planet from the Sun:
% ?- distance_from_sun(mars, Distance).
%
% To find the mass of a planet:
% ?- planet_mass(jupiter, Mass).

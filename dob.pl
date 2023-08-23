% Database of names and dates of birth
dob(john, date(1990, 5, 15)).
dob(emma, date(1987, 9, 3)).
dob(sarah, date(1995, 2, 22)).
dob(michael, date(1982, 11, 8)).
dob(lisa, date(2000, 7, 11)).

% Predicate to find the age based on DOB
age(Name, Age) :-
    dob(Name, DOB),
    get_time(CurrentTime),
    stamp_date_time(CurrentTime, CurrentDate, local),
    DOB = date(Year, Month, Day),
    date_time_stamp(date(CurrentYear, CurrentMonth, CurrentDay, 0, 0, 0, local), CurrentStamp),
    date_time_stamp(date(Year, Month, Day, 0, 0, 0, local), DOBStamp),
    Age is floor((CurrentStamp - DOBStamp) / (365.25 * 24 * 60 * 60)).

% Query examples
% To find the DOB of a person:
% ?- dob(john, DOB).
%
% To find the age of a person:
% ?- age(emma, Age).

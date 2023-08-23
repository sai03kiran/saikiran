% Database of students
student(john).
student(emma).
student(sarah).
student(michael).
student(lisa).

% Database of teachers
teacher(ms_smith).
teacher(mr_jones).
teacher(mrs_davis).

% Database of subjects and their corresponding codes
subject(math, m101).
subject(physics, p201).
subject(chemistry, c301).
subject(history, h401).
subject(english, e501).

% Predicate to find students taught by a teacher
teaches_subject(ms_smith, math).
teaches_subject(ms_smith, history).
teaches_subject(mr_jones, physics).
teaches_subject(mr_jones, chemistry).
teaches_subject(mrs_davis, english).

% Predicate to find the subject code of a subject
subject_code(Subject, Code) :-
    subject(Subject, Code).

% Query examples
% To find the subjects taught by a teacher:
% ?- teaches_subject(ms_smith, Subject).
%
% To find the subject code of a subject:
% ?- subject_code(physics, Code).

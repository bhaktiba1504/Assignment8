:- initialization(main).
% Basic Facts
parent(raj, ananya).
parent(raj, arjun).
parent(priya, ananya).
parent(priya, arjun).
parent(ananya, diya).
parent(ananya, kabir).
parent(rahul, diya).
parent(rahul, kabir).
parent(arjun, rhea).
parent(arjun, om).
parent(sneha, rhea).
parent(sneha, om).

male(raj).
male(arjun).
male(rahul).
male(kabir).
male(om).

female(priya).
female(ananya).
female(sneha).
female(diya).
female(rhea).

% Derived Rules

% X is grandparent of Y if X is parent of Z and Z is parent of Y
grandparent(X, Y) :- 
    parent(X, Z),
    parent(Z, Y).

% X and Y are siblings if they share a parent and are not the same person
sibling(X, Y) :- 
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% X and Y are cousins if their parents are siblings
cousin(X, Y) :- 
    parent(A, X),
    parent(B, Y),
    sibling(A, B).

% Child relationship
child(X, Y) :- 
    parent(Y, X).

% Descendant relationship using recursion
descendant(X, Y) :- 
    parent(Y, X).
descendant(X, Y) :- 
    parent(Y, Z),
    descendant(X, Z).

% Main function to run in online compiler
main :-
    % Example queries with outputs
    write('Children of Ananya:'), nl,
    child(X, ananya), write(X), nl, fail; nl,

    write('Siblings of Arjun:'), nl,
    sibling(X, arjun), write(X), nl, fail; nl,

    write('Grandchildren of Raj:'), nl,
    grandparent(raj, X), write(X), nl, fail; nl,

    write('Is Rhea a cousin of Diya? '),nl,
    (cousin(rhea, diya) -> write('Yes'); write('No')), nl,

    write('Descendants of Raj:'), nl,
    descendant(X, raj), write(X), nl, fail; nl.


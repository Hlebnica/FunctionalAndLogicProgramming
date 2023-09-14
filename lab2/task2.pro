% Дерево родственных отношений
parent(ivan, stepan).
parent(ivan, fedor).
parent(maria, fedor).
parent(maria, stepan).
parent(fedor, olga).
parent(fedor, tatiana).

% Задание 2
% ----------------------------------------------------------------------------------------
% 1) Является ли Федор родителем Ольги?
is_fedor_parent_olga() :- parent(fedor, olga).

% 2) Кто является родителем Татьяны?
parent_of_tatiana(PersonX) :- parent(PersonX, tatiana).

% 3) Кто дети Ивана?
ivan_childrens(PersonX) :- parent(ivan, PersonX).

% 4) Кто является родителем родителя Ольги?
parent_of_olga(PersonX) :- parent(PersonX, olga).

% 5) Кто внук Ивана?
ivan_grandson(PersonX) :- parent(ivan, PersonY), parent(PersonY, PersonX).

% 6) Есть ли у Федора и Степана общий родитель?
shared_parent(PersonX, PersonY) :- parent(PersonZ, PersonX), parent(PersonZ, PersonY), PersonX \= PersonY.

% 7) Кто чей родитель?
who_whos_parent(PersonX, PersonY) :-
    (
        parent(PersonX, PersonY) ->
            write(PersonX), write(' is '), write(PersonY), write(' parent'), nl
        ;
        parent(PersonY, PersonX) ->
            write(PersonY), write(' is '), write(PersonX), write(' parent'), nl
        ;
            write('Not being a parent to each other'), nl
        ).
% ----------------------------------------------------------------------------------------    


% Задание 3
% ----------------------------------------------------------------------------------------
gender(ivan, male).
gender(fedo, male).
gender(stepan, male).

gender(maria, female).
gender(olga, female).
gender(tatiana, female).

is_sisters(PersonX, PersonY) :-
    parent(PersonZ, PersonX),
    parent(PersonZ, PersonY),
    PersonX \= PersonY,
    gender(PersonX, female),
    gender(PersonY, female).
% ----------------------------------------------------------------------------------------


% Задание 4
% ----------------------------------------------------------------------------------------
has_a_child(PersonX) :- parent(PersonX, _).
% ----------------------------------------------------------------------------------------


% Задание 5
% ----------------------------------------------------------------------------------------
% Отношение "брат"
brother(PersonX, PersonY) :- 
    PersonX \= PersonY,  
    parent(PersonZ, PersonX), 
    parent(PersonZ, PersonY).

% Отношение "дядя"
uncle(PersonX, PersonY) :- 
    PersonX \= PersonY,  
    brother(PersonX, PersonZ),
    parent(PersonZ, PersonY).
% ----------------------------------------------------------------------------------------
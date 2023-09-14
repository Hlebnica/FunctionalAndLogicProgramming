% Дерево родственных отношений
parent(ivan, stepan).
parent(ivan, fedor).
parent(maria, stepan).
parent(maria, fedor).
parent(fedor, olga).
parent(fedor, tatiana).

% Задание 2
% ----------------------------------------------------------------------------------------
% 1) Является ли Федор родителем Ольги?
is_fedor_parent_olga() :- parent(fedor, olga).

% 2) Кто является родителем Татьяны?
parent_of_tatiana(X) :- parent(X, tatiana).

% 3) Кто дети Ивана?
ivan_childrens(X) :- parent(ivan, X).

% 4) Кто является родителем родителя Ольги?
parent_of_olga(X) :- parent(X, olga).

% 5) Кто внук Ивана?
ivan_grandson(X) :- parent(ivan, Y), parent(Y, X).

% 6) Есть ли у Федора и Степана общий родитель?
shared_parent(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% 7) Кто чей родитель?
who_whos_parent(X, Y) :-
    (
        parent(X, Y) ->
            write(X), write(' is '), write(Y), write(' parent'), nl
        ;
        parent(Y, X) ->
            write(Y), write(' is '), write(X), write(' parent'), nl
        ;
            write('Not being a parent to each other'), nl
        ).
% ----------------------------------------------------------------------------------------    


% Задание 3
% К базе знаний «Родственники» добавьте отношения «мужчина» и «женщина» и правило, определяющее,
% являются ли два субъекта друг другу сестрами. Используя процесс вычисления цели (запустив проект),
% получите ответ на вопрос: сестра ли Ольга Татьяне?
% ----------------------------------------------------------------------------------------
gender(ivan, male).
gender(fedor, male).
gender(stepan, male).

gender(maria, female).
gender(olga, female).
gender(tatiana, female).

is_sisters(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y,
    gender(X, female),
    gender(Y, female).
% ----------------------------------------------------------------------------------------


% Задание 4
% Введите отношение «имеет_ребенка»: всякий родитель имеет ребенка.
% Ответьте на вопрос: есть ли дети у Ивана, у Степана?
% ----------------------------------------------------------------------------------------
has_a_child(X) :- parent(X, _).
% ----------------------------------------------------------------------------------------


% Задание 5
% Определите отношение дядя(X, Y) через отношение родитель и брат.
% Является ли Степан дядей Ольги? Является ли Иван дядей Федору?
% ----------------------------------------------------------------------------------------
% Отношение "брат"
brother(X, Y) :-
    parent(Z, X), 
    parent(Z, Y),
    X \= Y,
    gender(X, male),  
    gender(Y, male).    

% Отношение "дядя"
uncle(X, Y) :- 
    parent(Z, Y),
    brother(X, Z).
% ----------------------------------------------------------------------------------------

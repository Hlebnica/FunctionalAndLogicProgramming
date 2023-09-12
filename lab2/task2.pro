% Факты о родительских отношениях
father(Ivan, Stepan).
father(Ivan, Fedor).
father(Fedor, Olga).
father(Fedor, Tatiana).
mother(Maria, Fedor).

parent(Ivan, Stepan).
parent(Ivan, Fedor).
parent(Fedor, Olga).
parent(Fedor, Tatiana).
parent(Maria, Fedor).

% Правила для вопросов

% 1) Является ли Федор родителем Ольги?
parent(Fedor, Olga).

% 2) Кто является родителем Татьяны?
parent(Parent, Tatiana) :- mother(Parent, Tatiana); father(Parent, Tatiana).

% 3) Кто дети Ивана?
whose_child(Ivan, Child).

% 4) Кто является родителем родителя Ольги?
parent(Grandparent, Olga) :- parent(Grandparent, Fedor), (mother(Grandparent, Fedor); father(Grandparent, Fedor)).

% 5) Кто внук Ивана?
grandson(Ivan, Grandchild) :- parent(Ivan, Parent), parent(Parent, Grandchild).

% 6) Есть ли у Федора и Степана общий родитель?
shared_parent(Fedor, Stepan) :- parent(Parent, Fedor), parent(Parent, Stepan).

% 7) Кто чей родитель?
whose_parent(Parent, Child) :- parent(Parent, Child).

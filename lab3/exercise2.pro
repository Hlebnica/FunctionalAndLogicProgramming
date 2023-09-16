% Правило для нахождения НОД, когда X=Y
gcd(X, X, X).

% Правило для нахождения НОД, когда X<Y
gcd(X, Y, NOD) :-
    X < Y,
    Diff is Y - X,
    gcd(X, Diff, NOD).

% Правило для нахождения НОД, когда X>Y
gcd(X, Y, NOD) :-
    X > Y,
    gcd(Y, X, NOD).

% Запуск программы и запрос НОД
task2:-
    write('Input X: '), nl,
    read(X),
    write('Input Y: '), nl,
    read(Y),
    gcd(X, Y, NOD),
    write('NOD: '), write(NOD).

% Ввод чисел
main :-
    write('Input X: '),
    read(X),
    write('Input Y: '),
    read(Y),
    calculate_result(X, Y, Result),
    write('Result: '), write(Result), nl.

% Значение выражения
calculate_result(X, Y, Result) :-
    Result is (25 + Y + (X**2)) / ((6 * (Y**X)) * sin(330)).
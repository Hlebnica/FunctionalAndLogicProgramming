% Генерация случайного числа
main :-
    random(1, 100, Number), % Генерируем случайное число от 1 до 100
    write('Random number: '), write(Number), nl,
    check_even_odd(Number).

% Четность числа
check_even_odd(Number) :-
    (Number mod 2 =:= 0 ->
        write(Number), write(' - even number'), nl
    ;
        write(Number), write(' - odd number'), nl
    ).
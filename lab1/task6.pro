% Ввод числа
main :-
    write('Insert number: '),
    read(Number),
    check_even_odd(Number).

% Четность числа
check_even_odd(Number) :-
    (Number mod 2 =:= 0 ->
        write(Number), write(' - even number'), nl
    ;
        write(Number), write(' - odd number'), nl
    ).

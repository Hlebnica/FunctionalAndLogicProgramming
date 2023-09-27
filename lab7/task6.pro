read_and_print_file(Filename) :-
    open(Filename, read, Stream), % Открываем файл для чтения
    repeat,
    read_line_to_codes(Stream, Line), % Считываем строку из файла
    ( Line \= end_of_file ->
        atom_codes(Atom, Line), % Преобразуем строки в атом
        writeln(Atom), % Выводим строку на экран
        fail % Находим следующую строку
    ; 
        close(Stream) % Закрываем файл
    ).

% Запуск программы для файла "task6.txt"
:- read_and_print_file('task6.txt').

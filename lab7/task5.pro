main :-
    open('output.txt', write, Stream), % Открываем файл "output.txt" для записи
    write(Stream, 'textTask5'), % Записываем в файл
    close(Stream), % Закрываем файл
    writeln('Text has been written to output.txt file.').

:- main.
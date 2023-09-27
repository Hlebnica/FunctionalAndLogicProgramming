main :-
    writeln('Enter a text:'),
    read_string(user_input, '\n', '\r', _, InputText), % Считываем строку с клавиатуры
    open('output.txt', write, Stream), % Открываем файл "output.txt" для записи
    write(Stream, InputText), % Записываем в файл
    close(Stream), % Закрываем файл
    writeln('Text has been written to output.txt file.').

:- main.
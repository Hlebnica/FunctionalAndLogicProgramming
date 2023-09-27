% Создание файла
create_empty_file(FileName) :-
    open(FileName, write, Stream),
    close(Stream),
    writeln('The file has been successfully created.').

main :-
    write('Input the file name (with extension): '),
    read_line_to_string(user_input, FileName),
    create_empty_file(FileName).

:- main.

% Поиск максимальной длины строки в списке строк
max_length([], 0). % Базовый случай: для пустого списка длина равна 0
max_length([H|T], Max) :-
    max_length(T, MaxT), % Рекурсивно находим максимальную длину в хвосте списка
    string_length(H, Len), % Вычисляем длину текущей строки
    Max is max(MaxT, Len). % Сравниваем текущую длину с максимальной и выбираем большую

% Дополнение строки символами "*" до максимальной длины
pad_with_asterisks(String, MaxLength, Result) :-
    string_length(String, Length), % Вычисляем длину входной строки
    Diff is MaxLength - Length, % Вычисляем разницу между максимальной длиной и текущей длиной
    string_repeat("*", Diff, Padding), % Создание строки из символов "*"
    string_concat(String, Padding, Result). % Конкатенируем входную строку с дополнением

% Чтение строки из файла, дополнение и запись в новый файл
process_file(InputFile, OutputFile) :-
    open(InputFile, read, InputStream), 
    open(OutputFile, write, OutputStream), 
    read_lines(InputStream, Lines), % Чтение строки из входного файла
    max_length(Lines, MaxLength), % Поиск максимальной длины строк
    close(InputStream), 
    process_lines(Lines, MaxLength, OutputStream), % Обработка строк и запись в выходной файл
    close(OutputStream). 

% Чтение строки из потока ввода и запись в поток вывода
process_lines([], _, _). % Базовый случай: для пустого списка строк заканчиваем обработку
process_lines([Line|Rest], MaxLength, OutputStream) :-
    pad_with_asterisks(Line, MaxLength, PaddedLine), % Дополнение текущей строки
    write(OutputStream, PaddedLine), 
    nl(OutputStream),
    process_lines(Rest, MaxLength, OutputStream). 

% Чтение строки из потока ввода и возврат списка строк
read_lines(Stream, []) :- % Базовый случай: если поток закрыт, список строк пуст
    at_end_of_stream(Stream).
read_lines(Stream, [Line|Rest]) :-
    \+ at_end_of_stream(Stream), % Пока не достигнут конец потока
    read_line_to_string(Stream, Line), % Чтение строки из потока
    read_lines(Stream, Rest). 

% Создание строки, состоящей из повторяющихся символов
string_repeat(_, 0, ""). % Базовый случай: для 0 повторений строка пустая
string_repeat(Char, N, Result) :-
    N > 0, % Если количество повторений больше 0
    N1 is N - 1, % Уменьшаем количество повторений
    string_repeat(Char, N1, Rest), % Рекурсивно создаем остаток строки
    string_concat(Char, Rest, Result). % Конкатенируем текущий символ с остатком

% process_file('variant8.txt', 'variant8new.txt').
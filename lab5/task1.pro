% Факты о списке целых чисел
my_list([1, 2, 3, 4, 5, 6, 7]).

% Предикат для вывода всех элементов списка
print_all_elements(List) :-
    writeln('All Elements of the List:'),
    forall(
        member(Element, List),
        writeln(Element)
    ).

% Предикат для подсчета количества элементов в списке
count_elements(List, Count) :-
    length(List, Count).

% Предикат для поиска N-го элемента списка
find_nth_element(List, N, Element) :-
    nth1(N, List, Element),
    !. % Выход из предиката после нахождения элемента
find_nth_element(_, _, 'Element does not exist').

% Основной предикат для выполнения всей программы
main :-
    my_list(List), % Загружаем список
    print_all_elements(List),
    count_elements(List, Count),
    format('Number of Elements in the List: ~w', [Count]), nl,
    write('Enter the position (N) of the element you want to find: '),
    read(N),
    find_nth_element(List, N, Element),
    writeln(Element).

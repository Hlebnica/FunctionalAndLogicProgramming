% Список чисел
my_list([1, 2, 3, 4, 5, 6, 7]).

% Вывод всех элементов списка
print_all_elements(List) :-
    writeln('All Elements of the List:'),
    forall(
        member(Element, List),
        writeln(Element)
    ).

% Подсчет количества элементов в списке
count_elements(List, Count) :-
    length(List, Count).

% Поиск N-го элемента списка
find_nth_element(List, N, Element) :-
    nth1(N, List, Element),
    !. % Выход из предиката после нахождения элемента
find_nth_element(_, _, 'Element does not exist').


main :-
    my_list(List), % Загружаем список
    print_all_elements(List),
    count_elements(List, Count),
    format('Number of Elements in the List: ~w', [Count]), nl,
    write('Enter the position (N) of the element you want to find: '),
    read(N),
    find_nth_element(List, N, Element),
    writeln(Element).

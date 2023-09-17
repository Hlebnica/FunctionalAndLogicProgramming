% Факты о игрушках: наименование, количество и цена за единицу
toy('Toy1', 5, 10).
toy('Toy2', 10, 5).
toy('Toy3', 3, 15).
toy('Toy4', 8, 8).
toy('Toy5', 2, 20).

% Предикат для получения сведений о игрушке
get_toy_info(Name, Quantity, Price) :-
    toy(Name, Quantity, Price).

% Предикат для вывода списка всех игрушек с указанием общей стоимости
print_all_toys_with_total_cost :-
    writeln('List of All Toys with Total Cost:'),
    forall(
        get_toy_info(Name, Quantity, Price),
        (
            TotalCost is Quantity * Price,
            format('Name: ~w, Quantity: ~w, Price: ~w, Total Cost: ~w', [Name, Quantity, Price, TotalCost]),
            nl
        )
    ).

% Основной предикат для выполнения всей программы
main :-
    trace,  % Включаем режим трассировки
    print_all_toys_with_total_cost,
    notrace.  % Выключаем режим трассировки после вывода

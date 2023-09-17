% Факты о рейсах: номер рейса, пункт назначения, цена билета
flight(1, 'New York', 500).
flight(2, 'Los Angeles', 450).
flight(3, 'Chicago', 400).
flight(4, 'Miami', 550).
flight(5, 'San Francisco', 480).

% Предикат для вывода всей информации о рейсах
print_all_flights :-
    writeln('Flight Information:'),
    forall(
        flight(FlightNumber, Destination, TicketPrice),
        (
            format('Flight Number: ~w, Destination: ~w, Ticket Price: $~w', [FlightNumber, Destination, TicketPrice]),
            nl
        )
    ).

% Предикат для поиска пункта назначения по номеру рейса
find_destination_by_flight_number(FlightNumber, Destination) :-
    flight(FlightNumber, Destination, _).

% Предикат для поиска рейсов с ценой билета ниже указанной
find_flights_with_price_below(Price, FlightList) :-
    findall(
        (FlightNumber, Destination, TicketPrice),
        (flight(FlightNumber, Destination, TicketPrice), TicketPrice < Price),
        FlightList
    ).

% Основной предикат для выполнения всей программы
main :-
    writeln('Welcome to the Flight Information System!'),
    print_all_flights,
    nl,
    write('Enter a flight number to find its destination: '),
    read(FlightNumber),
    (find_destination_by_flight_number(FlightNumber, Destination) ->
        format('The destination for flight ~w is ~w', [FlightNumber, Destination])
    ;
        writeln('Flight not found!')
    ),
    nl,
    write('Enter a maximum ticket price to find flights below that price: $'),
    read(MaxPrice),
    find_flights_with_price_below(MaxPrice, FlightList),
    writeln('Flights with ticket price below specified amount:'),
    print_all_matching_flights(FlightList).

% Предикат для вывода списка рейсов с ценой билета
print_all_matching_flights([]).
print_all_matching_flights([(FlightNumber, Destination, TicketPrice)|Residue]) :-
    format('Flight Number: ~w, Destination: ~w, Ticket Price: $~w', [FlightNumber, Destination, TicketPrice]),
    nl,
    print_all_matching_flights(Residue).

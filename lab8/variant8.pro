% Define the train schedule database.
train_schedule(train(1, 'Moscow', '08:00', '04:30', 100)).
train_schedule(train(2, 'Moscow', '09:30', '05:00', 120)).
train_schedule(train(3, 'Moscow', '10:45', '04:45', 110)).
train_schedule(train(4, 'Moscow', '12:15', '04:15', 90)).
train_schedule(train(5, 'St. Petersburg', '07:30', '05:15', 130)).
train_schedule(train(6, 'St. Petersburg', '10:00', '05:45', 140)).

% Define a predicate to calculate the arrival time.
arrival_time(DepartureTime, TravelTime, ArrivalTime) :-
    time_to_minutes(DepartureTime, DepartureMinutes),
    time_to_minutes(TravelTime, TravelMinutes),
    ArrivalMinutes is DepartureMinutes + TravelMinutes,
    minutes_to_time(ArrivalMinutes, ArrivalTime).

% Define a predicate to find the fastest train to Moscow.
fastest_train_to_moscow(Number, DepartureTime) :-
    train_schedule(train(Number, 'Moscow', DepartureTime, TravelTime, _)),
    arrival_time(DepartureTime, TravelTime, ArrivalTime),
    \+ (train_schedule(train(_, 'Moscow', _, OtherTravelTime, _)), arrival_time(_, OtherTravelTime, OtherArrivalTime), OtherArrivalTime < ArrivalTime).

% Convert time in 'hh:mm' format to minutes since midnight.
time_to_minutes(Time, Minutes) :-
    split_string(Time, ":", "", [HourStr, MinuteStr]),
    number_string(Hour, HourStr),
    number_string(Minute, MinuteStr),
    Minutes is Hour * 60 + Minute.

% Convert minutes since midnight to time in 'hh:mm' format.
minutes_to_time(Minutes, Time) :-
    Hour is Minutes // 60,
    Minute is Minutes mod 60,
    format(atom(Time), '~02d:~02d', [Hour, Minute]).
    
% Define the main rule to find and display information about the fastest train to Moscow.
main :-
    fastest_train_to_moscow(Number, DepartureTime),
    write('The fastest train to Moscow is Train Number '), write(Number),
    write(' departing at '), write(DepartureTime), nl.

% Query to find and display the fastest train to Moscow.
:- main.

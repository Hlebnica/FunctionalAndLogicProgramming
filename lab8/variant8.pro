% Database of train schedules
train_schedule(1, 'Moscow', '08:00', '04:30', 100).
train_schedule(2, 'Moscow', '09:30', '05:00', 120).
train_schedule(3, 'Moscow', '11:00', '04:45', 90).
train_schedule(4, 'St. Petersburg', '07:45', '05:15', 110).
train_schedule(5, 'St. Petersburg', '10:15', '05:30', 130).
train_schedule(6, 'St. Petersburg', '12:30', '05:45', 105).

% Rule to calculate the arrival time
calculate_arrival_time(DepartureTime, TravelTime, ArrivalTime) :-
    time(Hours1, Minutes1, DepartureTime),
    time(Hours2, Minutes2, TravelTime),
    TotalMinutes is (Hours1 * 60 + Minutes1) + (Hours2 * 60 + Minutes2),
    ArrivalHours is TotalMinutes // 60,
    ArrivalMinutes is TotalMinutes mod 60,
    format(atom(ArrivalTime), '~02d:~02d', [ArrivalHours, ArrivalMinutes]).

% Rule to find the fastest train to Moscow
find_fastest_train_to_moscow(TrainNumber, DepartureTime) :-
    train_schedule(TrainNumber, 'Moscow', DepartureTime, TravelTime, _),
    calculate_arrival_time(DepartureTime, TravelTime, ArrivalTime),
    \+ (train_schedule(_, 'Moscow', _, OtherTravelTime, _), 
       calculate_arrival_time(_, OtherTravelTime, OtherArrivalTime), 
       ArrivalTime > OtherArrivalTime).

% Main rule to display information about the fastest train to Moscow
variant8 :-
    find_fastest_train_to_moscow(TrainNumber, DepartureTime),
    write('The fastest train to Moscow is Train #'), write(TrainNumber),
    write(' departing at '), write(DepartureTime), nl.

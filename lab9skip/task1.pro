% Define the knowledge about dog breeds
dog_breed('English Bulldog', ['short hair', 'height 55 cm', 'low-set tail', 'good temperament']).
dog_breed('Bloodhound', ['short hair', 'height 55 cm', 'long ears', 'good temperament']).
dog_breed('Great Dane', ['short hair', 'low-set tail', 'good temperament', 'weight 45 kg']).
dog_breed('Cocker Spaniel', ['long hair', 'height 55 cm', 'low-set tail', 'long ears', 'good temperament']).
dog_breed('Irish Setter', ['long hair', 'height 75 cm', 'long ears']).
dog_breed('Saint Bernard', ['long hair', 'low-set tail', 'good temperament', 'weight 45 kg']).

% Define the database to store user responses
:- dynamic database/2.

% Main function to identify the dog breed
identify_dog_breed(Breed) :-
    write('Enter dog characteristics (comma-separated): '), nl,
    read(Response),
    process_characteristics(Response, Breed).

% Process user responses to identify the dog breed
process_characteristics([], Breed) :-
    find_best_match(Breed).
process_characteristics([Characteristic | Rest], Breed) :-
    (positive_response(Characteristic) -> assert(database(Characteristic, yes)); assert(database(Characteristic, no))),
    process_characteristics(Rest, Breed).

% Find the best matching dog breed based on user responses
find_best_match(Breed) :-
    dog_breed(Breed, Characteristics),
    check_characteristics(Characteristics),
    format('The identified dog breed is ~w.~n', [Breed]).

% Check if the characteristics match user responses
check_characteristics([]).
check_characteristics([Characteristic | Rest]) :-
    (database(Characteristic, yes); \+ database(Characteristic, no)),
    check_characteristics(Rest).

% Define positive responses for characteristics
positive_response('short hair').
positive_response('long hair').
positive_response('height 55 cm').
positive_response('height 75 cm').
positive_response('low-set tail').
positive_response('long ears').
positive_response('good temperament').
positive_response('weight 45 kg').

% Clear the database and start over
clear_database :-
    retractall(database(_, _)),
    write('Database cleared. You can start over.'), nl.

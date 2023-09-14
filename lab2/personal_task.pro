% Факты о странах
country(country_name('Russia'), capital('Moscow'), population(146599183), region('Europe')).
country(country_name('China'), capital('Beijing'), population(1444216107), region('Asia')).
country(country_name('Germany'), capital('Berlin'), population(83190556), region('Europe')).
country(country_name('France'), capital('Paris'), population(67364357), region('Europe')).
country(country_name('India'), capital('New Delhi'), population(1380004385), region('Asia')).

% Вывести всю информацию о стране
print_country_info(Country) :-
    country(country_name(Country), capital(Capital), population(Population), region(Region)),
    write('Country: '), write(Country), nl,
    write('Capital: '), write(Capital), nl,
    write('Population: '), write(Population), nl,
    write('Region: '), write(Region), nl, nl.

% Вывести информацию о странах с численностью населения больше заданного значения
print_countries_above_population(Threshold) :-
    country(country_name(Country), capital(Capital), population(Population), region(Region)),
    Population > Threshold,
    write('Country: '), write(Country), nl,
    write('Capital: '), write(Capital), nl,
    write('Population: '), write(Population), nl,
    write('Region: '), write(Region), nl, nl.

% Вывести информацию о европейских странах с численностью населения не больше заданного значения
print_european_countries_below_population(Threshold) :-
    country(country_name(Country), capital(Capital), population(Population), region('Europe')),
    Population =< Threshold,
    write('Country: '), write(Country), nl,
    write('Capital: '), write(Capital), nl,
    write('Population: '), write(Population), nl, nl.


% Выполнение пунктов a, b, c
task_a :-
    % Вывести всю информацию о странах
    writeln('All information from the directory:'),
    country(country_name(Country), _, _, _),
    print_country_info(Country),
    fail.

task_b :-
    % Вывести информацию о странах с численностью населения больше заданного значения
    writeln('Information on countries whose population exceeds a given value:'),
    Threshold1 = 100000000,
    print_countries_above_population(Threshold1),
    fail.

task_c :-
    % Вывести информацию о европейских странах с численностью населения не больше заданного значения
    writeln('Information on European countries whose population does not exceed a given value:'),
    Threshold2 = 80000000,
    print_european_countries_below_population(Threshold2),
    fail.

    

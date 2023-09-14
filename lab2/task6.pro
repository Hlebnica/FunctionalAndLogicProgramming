film(1, 'Redemption', 'United Kingdom', 130, 'melodrama', '19.02.2008').
film(2, 'Canned', 'Russia', 115, 'thriller', '22.02.2007').
film(3, 'Paragraph 78', 'Russia', 90, 'action', '22.02.2007'). 
film(4, 'Children of Spies', 'USA', 90, 'comedy', '30.03.2001'). 
film(5, 'The Hidden Menace', 'USA', 90, 'thriller', '2.11.2001').
film(6, 'My Boss Daughter', 'USA', 90, 'comedy', '22.08.2003').

% Напечатать название мелодрамы
print_melodrama_title(Title) :-
    film(_, Title, _, _, 'melodrama', _).

% Напечатать название хотя бы одного американского фильма
print_american_film_title(Title) :-
    film(_, Title, 'USA', _, _, _).

% Напечатать название хотя бы одного фильма, выпущенного позже 2005 года
print_recent_film_title(Title) :-
    film(_, Title, _, _, _, Date),
    date_to_year(Date, Year),
    Year > 2005.

% Предикат для преобразования даты в год
date_to_year(Date, Year) :-
    atom_chars(Date, Chars),
    append(_, [YearChar1,YearChar2,YearChar3,YearChar4|_], Chars),
    atom_chars(YearAtom, [YearChar1,YearChar2,YearChar3,YearChar4]), 
    atom_number(YearAtom, Year).


main :-
    once(print_melodrama_title(MelodramaTitle)),
    once(print_american_film_title(AmericanTitle)),
    once(print_recent_film_title(RecentTitle)),
    writeln('Melodrama title: '),
    writeln(MelodramaTitle), nl,
    writeln('Title of USA film: '),
    writeln(AmericanTitle), nl,
    writeln('Title of a film released later than 2005: '),
    writeln(RecentTitle).
    


read_list(List) :-
    % чтение строки с клавиатуры и возврат в виде списка кодов символов
    read_line_to_codes(user_input, Input), 
    % преобразование списка кодов символов в атом 
    atom_codes(Atom, Input),
    % разбить атом на элементы и создаить список List 
    split_string(Atom, " ", " ", List).

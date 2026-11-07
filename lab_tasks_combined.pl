% --- Part 1: Shopping Program ---

% Start the program with a default basket of five items
start :-
    InitialBasket = [apple, bread, milk, eggs, cheese],
    menu(InitialBasket).

% Display the menu and read the user's choice
menu(Basket) :-
    nl,
    writeln('--- Shopping Menu ---'),
    writeln('d - Display all items'),
    writeln('a - Add an item'),
    writeln('e - Exit'),
    write('Enter your choice: '),
    read(Choice),
    handle_choice(Choice, Basket).

% Handle 'd': Display all items and show the menu again
handle_choice(d, Basket) :-
    writeln('Current basket:'),
    display_items(Basket),
    menu(Basket).

% Handle 'a': Add an item to the list and show the menu again
handle_choice(a, Basket) :-
    write('Enter the item to add (followed by a period, e.g., juice.): '),
    read(NewItem),
    NewBasket = [NewItem | Basket],
    writeln('Item added.'),
    menu(NewBasket).

% Handle 'e': Exit the program
handle_choice(e, _) :-
    writeln('Exiting the shopping program. Goodbye!').

% Handle invalid input
handle_choice(_, Basket) :-
    writeln('Invalid choice. Please enter d, a, or e.'),
    menu(Basket).

% Base case for recursion: stopping at the empty list
display_items([]).

% Recursive step: display the head, then process the tail
display_items([Item | Rest]) :-
    write('- '), writeln(Item),
    display_items(Rest).


% --- Part 2: Add at the End ---

% Base case: Adding X to the end of an empty list results in a list containing only X.
add_at_the_end(X, [], [X]).

% Recursive step: The head of the list remains the same, and we recursively 
% add X to the end of the Tail to form the ResultTail.
add_at_the_end(X, [Head|Tail], [Head|ResultTail]) :-
    add_at_the_end(X, Tail, ResultTail).

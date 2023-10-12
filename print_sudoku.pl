solve_and_print(ProblemID) :-
    % Obtém a representação do problema
    problem(ProblemID, Rows),
    
    % Imprime o Sudoku não resolvido
    writeln('Antes de resolver:'),
    print_sudoku(Rows),
    
    % Resolve o Sudoku
    sudoku(Rows),
    
    % Imprime o Sudoku resolvido
    writeln('\nResolvido:'),
    print_sudoku(Rows).


print_sudoku(Rows) :- 
    forall(member(Row, Rows), print_row(Row)),
    nl.

print_row(Row) :- 
    forall(member(Cell, Row), print_cell(Cell)),
    write('|'), nl.

print_cell(Cell) :- 
    var(Cell),
    write(' . '),
    !.
print_cell(Cell) :- 
    integer(Cell),
    writef(' %d ', [Cell]).
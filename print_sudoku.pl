solve_and_print(ProblemID) :-
    % Obtém a representação do problema
    problem(ProblemID, Rows),
    
    % Imprime o Sudoku não resolvido
    writeln('\nAntes de resolver:\n'),
    print_sudoku(Rows),
    
    % Resolve o Sudoku aplicando o predicado sudoku/1
    sudoku(Rows),
    
    % Imprime o Sudoku resolvido
    writeln('\nResolvido:\n'),
    print_sudoku(Rows).

% Imprime um tabuleiro de Sudoku.
print_sudoku(Rows) :-
    % Inicializa a contagem de linhas em 1.
    print_sudoku(Rows, 1).

% Caso base: se não houver mais linhas, termine a execução.
print_sudoku([], _).

% Imprime cada linha do Sudoku.
% Adiciona um separador após cada conjunto de 3 linhas.
% [Row|Rest] está dividindo o primeiro elemento (Row) do resto dos elementos (Rest) da lista
print_sudoku([Row|Rest], N) :-
    % Imprime a linha atual.
    print_row(Row),
    % Se N é múltiplo de 3, imprime um separador. Caso contrário, apenas passa para a próxima linha.
    (N mod 3 =:= 0, N \=9 -> write('_____________________________\n'), nl ; true),
    N1 is N + 1,  % Incrementa o contador de linhas.
    print_sudoku(Rest, N1).

% Inicializa a contagem de células em 1 para imprimir cada linha.
print_row(Row) :- 
    print_row(Row, 1).

% Caso base para a impressão da linha: se não houver mais células, termine a linha.
print_row([], _) :- 
    nl.

% Imprime cada célula da linha.
% Adiciona um separador vertical após cada conjunto de 3 células.
% [Cell|Rest] está dividindo o primeiro elemento (Cell) do resto dos elementos (Rest) da lista
print_row([Cell|Rest], N) :-
    print_cell(Cell),  % Imprime a célula atual.
    % Se N é múltiplo de 3, imprime um separador. Caso contrário, não faz nada.
    (N mod 3 =:= 0, N \=9 -> write('|') ; true),
    N1 is N + 1,  % Incrementa o contador de células.
    print_row(Rest, N1).

% Se a célula é uma variável (não preenchida), imprime um "x".
print_cell(Cell) :- 
    var(Cell),
    write(' x '),
    !.

% Se a célula é um número inteiro, imprime o número.
print_cell(Cell) :- 
    integer(Cell),
    writef(' %d ', [Cell]).

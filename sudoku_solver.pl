:- consult(print_sudoku).

% Importa a biblioteca clpfd, que fornece ferramentas para lidar com problemas de satisfação de restrições.
:- use_module(library(clpfd)).

% Define o predicado sudoku/1 que recebe as linhas de um Sudoku como argumento.
sudoku(Rows) :-
        % Certifica-se de que há 9 linhas no Sudoku.
        length(Rows, 9),
        
        % Certifica-se de que todas as linhas têm o mesmo comprimento (9 elementos).
        maplist(same_length(Rows), Rows),
        
        % Converte a matriz 2D 'Rows' em uma lista 1D 'Vs'.
        append(Rows, Vs),
        
        % Restrição: Cada valor em Vs deve estar entre 1 e 9.
        Vs ins 1..9,
        
        % Restrição: Todos os números em cada linha devem ser distintos.
        maplist(all_distinct, Rows),
        
        % Transpõe as linhas para obter as colunas.
        transpose(Rows, Columns),
        
        % Restrição: Todos os números em cada coluna devem ser distintos.
        maplist(all_distinct, Columns),
        
        % Divide as linhas em três grupos para trabalhar com os blocos 3x3.
        Rows = [A,B,C,D,E,F,G,H,I],
        
        % Restrição: Todos os números em cada bloco 3x3 devem ser distintos.
        blocks(A, B, C), blocks(D, E, F), blocks(G, H, I).

% Caso base para a função blocks/3 quando não há mais elementos para processar.
blocks([], [], []).

% Define os blocos 3x3 e verifica se os números são distintos.
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        % Restrição: Os números de um bloco 3x3 devem ser distintos.
        all_distinct([A,B,C,D,E,F,G,H,I]),
        
        % Processa o próximo conjunto de elementos.
        blocks(Bs1, Bs2, Bs3).

% Exemplo de um problema Sudoku para ser resolvido.
problem(1, [[_,_,_, _,_,_, _,_,_],
            [_,_,_, _,_,3, _,8,5],
            [_,_,1, _,2,_, _,_,_],
            [_,_,_, 5,_,7, _,_,_],
            [_,_,4, _,_,_, 1,_,_],
            [_,9,_, _,_,_, _,_,_],
            [5,_,_, _,_,_, _,7,3],
            [_,_,2, _,1,_, _,_,_],
            [_,_,_, _,4,_, _,_,9]]).

% Exemplo de como usar o solver.
/** <examples>
?- problem(1, Rows), sudoku(Rows).
*/

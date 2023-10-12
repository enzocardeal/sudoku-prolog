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
        
        % Transpõe as linhas para obter as colunas como linhas.
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
% Recebe 3 linhas com no máximo 9 elementos cada. Pega os 3 primeiros elementos de cada linha, montando assim um bloco 3x3.
% O resto dos elementos (Bs1, Bs2 e Bs3) são processados de forma recursiva
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        % Restrição: Os números de um bloco 3x3 devem ser distintos.
        all_distinct([A,B,C,D,E,F,G,H,I]),
        
        % Processa o próximo conjunto de elementos.
        blocks(Bs1, Bs2, Bs3).

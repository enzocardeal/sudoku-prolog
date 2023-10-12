:- consult(print_sudoku).
:- consult(sudoku_solver).

% 2 Problemas de Sudoku para ser resolvido.

% Dificuldade Especialista
% Estado inicial de um problema de sudoku com identificador 1
problem(1, [[_,_,4, _,_,_, _,5,7],
    [_,_,_, _,_,_, 3,9,_],
    [_,_,_, 1,_,6, _,_,_],
    [1,_,5, 9,_,_, _,_,_],
    [9,4,_, 2,_,_, _,_,1],
    [_,_,_, _,_,3, _,_,_],
    [2,6,_, _,_,8, _,_,_],
    [_,8,_, _,_,_, 7,_,_],
    [_,_,_, 5,_,_, _,2,_]]).

% Dificuldade Diabólico
% Estado inicial de um problema de sudoku com identificador 2
problem(2, [[_,1,6, _,2,_, 9,_,8],
            [_,_,_, 8,_,_, _,4,_],
            [9,_,_, _,_,_, _,5,_],
            [6,_,_, 5,_,_, 1,_,3],
            [_,_,2, _,_,7, _,_,_],
            [_,_,_, _,_,_, _,9,_],
            [_,3,_, _,5,_, _,_,_],
            [_,_,_, _,_,_, _,_,4],
            [1,_,_, 3,_,_, 8,_,6]]).

% Problemas acessados no portal: https://sudoku.com/pt/
% Acessado em: 12/10/2023
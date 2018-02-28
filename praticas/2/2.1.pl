:-use_module(library(lists)).
% Dois baldes, de capacidades 4 litros e 3 litros, respetivamente, estão inicialmente vazios. Os baldes não possuem qualquer marcação intermédia.
%  As únicas operações que pode realizar são:
% esvaziar um balde
% encher (completamente) um balde
% despejar um balde para o outro até que o segundo fique cheio
% despejar um balde para o outro até que o primeiro fique vazio
% a)  Quais as operações a efetuar de modo a que o primeiro balde contenha 2 litros ? Resolva este problema usando a estratégia "primeiro em profundidade".
% b)  Quais as operações a efetuar de modo a que o primeiro balde contenha 2 litros ? Resolva este problema usando a estratégia "primeiro em largura".

clear:-write('\33\[2J').

child(1, 2).
child(1, 3).
child(2, 4).
child(2, 5).
child(2, 6).
child(3, 7).
child(3, 8).
child(4, 9).
child(4, 10).
child(7, 11).
child(7, 12).

end(12).

% dfs(Node):- format('testing ~d...', [Node]), child(Node, Child), end(Child), write('yes\n').
% dfs(Node):- write('no\n'), child(Node, Child), dfs(Child).

% bfs(Node):- format('testing ~d...', [Node]), child(Node, Child), end(Child), write('yes\n').
% bfs(Node):- write('no\n'), child(Node, Child), bfs(Child).

% Actions
% esvaziar um balde
% encher (completamente) um balde
% despejar um balde para o outro até que o segundo fique cheio
% despejar um balde para o outro até que o primeiro fique vazio

% esvaziar(B-C, 0-C).
% encher(B-C, C-C).
% despejar(B1-C1, B2-C2, )


% inicial: b(0,0).
% final: b(2, _).

% 2.1

%estado inicial
estado_inicial(b(0,0)).

%estado final
estado_final(b(2,0)).

%transições entre estados
sucessor(b(X,Y), b(4,Y)) :- X<4.
sucessor(b(X,Y), b(X,3)) :- Y<3.
sucessor(b(X,Y), b(0,Y)) :- X>0.
sucessor(b(X,Y), b(X,0)) :- Y>0.
sucessor(b(X,Y), b(4,Y1)) :-
    X+Y>=4,
    X<4,
    Y1 is Y-(4-X).
sucessor(b(X,Y), b(X1,3)) :-
    X+Y>=3,
    Y<3,
    X1 is X-(3-Y).
sucessor(b(X,Y), b(X1,0)) :-
    X+Y<4,
    Y>0,
    X1 is X+Y.
sucessor(b(X,Y), b(0,Y1)) :-
    X+Y<3,
    X>0,
    Y1 is X+Y.

start(dfs, S):-estado_inicial(Node), dfs(Node, [Node], S).

dfs(E, _, [E]):-estado_final(E).
dfs(E, V, [E|R]):-
    sucessor(E, E2),
    \+ member(E2, V),
    dfs(E2, [E2|V], R).

% dfs(State):-estado_final(State), write('end').
% dfs(State):-sucessor(State, NewState), format('testing ~p-...', [NewState]), dfs(NewState)

% dfs(Node):- format('testing ~p-...', [Node]), sucessor(Node, Child), estado_final(Child), write('yes\n').
% dfs(Node):- write('no\n'), sucessor(Node, Child), dfs(Child).

% start(dfs):-estado_inicial(Node), dfs(Node).


start(bfs, S):-estado_inicial(Node), bfs([[Node]], Sr), reverse(Sr, S).
bfs([[E|Caminho]|_], [E|Caminho]):-estado_final(E).
bfs([[E|Caminho]|R], S):-
    findall([E2|[E|Caminho]], sucessor(E, E2), LS),
    % findall([E2|[E|Caminho]], (sucessor(E, E2), \+ member(E2, [E|Caminho])), LS), % evita repetidos
    append(R, LS, L),
    bfs(L, S).


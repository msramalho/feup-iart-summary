:-use_module(library(lists)).
clear:-write('\33\[2J').
% Pesquisa informada:
% Greedy
% A*
% BnB (pesquisa uniforme)

% Baldes de água
% Custo -> consumo de água -> não funciona porque há operações que teriam custo 0
% Custo -> usar antes água transferida em vez de consumida, todos custam alguma coisa e a solução ótima é a que transfere menos água

%estado inicial
estado_inicial(b(0,0)).

%estado final
estado_final(b(2,0)).

%transições entre estados, agora com custo
sucessor(b(X,Y), b(4,Y), C) :- X<4, C is 4 - X. % encher o 1º balde
sucessor(b(X,Y), b(X,3), C) :- Y<3, C is 3 - Y. % encher o 2º balde
sucessor(b(X,Y), b(0,Y), X) :- X>0.
sucessor(b(X,Y), b(X,0), Y) :- Y>0.
sucessor(b(X,Y), b(4,Y1), C) :-
    X+Y>=4,
    X<4,
    Y1 is Y-(4-X),
    C is 4 - X.
sucessor(b(X,Y), b(X1,3), C) :-
    X+Y>=3,
    Y<3,
    X1 is X-(3-Y),
    C is 3 - Y.
sucessor(b(X,Y), b(X1,0), Y) :-
    X+Y<4,
    Y>0,
    X1 is X+Y.
sucessor(b(X,Y), b(0,Y1), X) :-
    X+Y<3,
    X>0,
    Y1 is X+Y.

%implementação da heuristica - tem de ser consistente e admissível (otimista) para o A*
%h(b(X,Y), H):- estado_final(b(Xf, Yf)), H is abs(X - Xf) + abs(Y - Yf). % não é admissível porque não é otimista
h(b(X,Y), H):- estado_final(b(Xf, Yf)), H is max(abs(X-Xf), abs(Y-Yf)). % não é ideal, mas é otimista

% implementação de greedy -> vai criar uma lista ordenada pelo melhor


greedy:-
    estado_inicial(B1),
    setof(C-B2, sucessor(B1, B2, C), L),
    write(L).

% implementação A* os estados estão ordenados por f(n) = g(n) + h(n), F é a função
astar(S):-
    estado_inicial(B),
    h(B, H),
    astar([H-0-B],S).
astar([F-G-[E|Caminho]|_], F-[E|Caminho]):- estado_final(E). % caso solução
astar([_-G-[E|Caminho]|R], S):-
    findall(F2-G2-[E2,E|Caminho], (
        sucessor(E, E2, C),
        G2 is G + C,
        h(E2, H2),
        F2 is G2 + H2
    ), L),
    append(R, L, NewList),
    sort(NewList, NewListSorted),
    astar(NewListSorted, S).
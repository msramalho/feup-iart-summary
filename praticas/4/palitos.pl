clear:-write('\33\[2J').
% 10 palitos, tirar 1, 2 ou 3 palitos, quem tirar o último perde
% representar o estado com número de palitos e próximo jogador
% (10, max). % configuração

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formalização do jogo dos palitos:
% - existem inicialmente 10 palitos sobre a mesa
% - cada jogador pode retirar um, dois ou três palitos na sua vez
% - o objectivo é evitar ficar com o último palito
%%%%%%%%%%

% a representação do estado vai incluir também o jogador a jogar, pois neste jogo é importante para efeitos de avaliação do estado

% representação de um estado: (NumeroPalitos, Quemjoga)
estado_inicial((10,max)).

% estado final (ter 0 palitos é bom): só interessa para o minimax simples
estado_final((0,max), 1).
estado_final((0,min), 0).

% transições entre estados (as jogadas são as mesmas para os 2 jogadores)
% se for o max passa para min e vice.versa
sucessor((N,max), max, (N1,min)) :- N>0, N1 is N-1.
sucessor((N,max), max, (N1,min)) :- N>1, N1 is N-2.
sucessor((N,max), max, (N1,min)) :- N>2, N1 is N-3.
sucessor((N,min), min, (N1,max)) :- N>0, N1 is N-1.
sucessor((N,min), min, (N1,max)) :- N>1, N1 is N-2.
sucessor((N,min), min, (N1,max)) :- N>2, N1 is N-3.

%chamar o minimax
mmPalito(Valor, Jogada):-
	estado_inicial(I),
	minimax(I, max, Valor, Jogada).

% minimax implementação genérica
% Estado, jogador, Valor, Jogada
minimax(E, _, V, _):- estado_final(E, V). % estado final
minimax(E, max, Valor, Jogada):-
	findall(E2, sucessor(E, max, E2), LSucessores), % expandir o nó
	max_val(LSucessores, Valor, Jogada). % Jogada é o melhor estado de LSucessores
minimax(E, min, Valor, Jogada):-
	findall(E2, sucessor(E, min, E2), LSucessores), % expandir o nó
	min_val(LSucessores, Valor, Jogada). % Jogada é o melhor estado de LSucessores

max_val([E], V, E):-minimax(E, min, V, _).
max_val([E1|Es], V, Me):- % MelhorEstado
	minimax(E1, min, V1, _),
	max_val(Es, V2, E2),
	(V1 > V2, !, V = V1, Me = E1; V = V2, Me = E2).
min_val([E], V, E):-minimax(E, max, V, _).
min_val([E1|Es], V, Me):- % MelhorEstado
	minimax(E1, max, V1, _),
	min_val(Es, V2, E2),
	(V1 < V2, !, V = V1, Me = E1; V = V2, Me = E2).

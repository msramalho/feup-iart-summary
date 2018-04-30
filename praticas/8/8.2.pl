clear:-write('\33\[2J').
% 8

% 8.1
% N de número
% G de género
% S de sujeito
% A de ação
% S de sujeito
% Ob de objeto

frase(A, S, Ob) --> sn(N, S), sv(N, A, Ob, S).
sn(N, S) --> determinante(N-G), nome(N-G, S).
sn(N, S) --> nome(N-_, S).
sv(N, gostar, Ob, S) --> verbo(N, gostar, S), {!}, proposicao(N1-G1), nome(N1-G1, Ob). % Nota 1
sv(N, A, Ob, S) --> verbo(N, A, S), sn(_, Ob).

concorda_frase(A, S, Ob):-
	P =.. [A, S, Ob], % link 1, Nota 2
	(P, !, write(concordo); write(discordo)).

% Notas:
% 1 - as chavetas são código prolog não DCG, neste caso é um cut para que o joão gosta morangos não seja válidas
% 2 - prolog é de primeira ordem e não de segunda, não há relações entre objetos que sejam quantificadores, é preciso operador extra-lógico univ

% Links:
% 1- http://www.swi-prolog.org/pldoc/doc_for?object=(%3D..)/2

% Exemplos:
% frase(A, S, Ob, [o,rui,joga,futebol], []). yes
% frase(A, S, Ob, [os,rui,joga,futebol], []). no
% frase(A, S, Ob, [o,rui,joga,futebol], []), concorda_frase(A, S, Ob). yes
% frase(A, S, Ob, [o, elefante, joga, futebol], []).

%%%
% gramática
%

determinante(s-m) --> [o].
determinante(p-m) --> [os].
determinante(s-f) --> [a].

proposicao(_) --> [de].
proposicao(s-f) --> [da].

nome(p-m, rapaz) --> [rapazes].
nome(s-m, rapaz) --> [rapaz].
nome(s-m, rui) --> [rui].
nome(s-m, luis) --> [luis].
nome(s-f, rita) --> [rita].
nome(s-f, ana) --> [ana].
nome(s-f, maria) --> [maria].
nome(s-m, elefante) --> [elefante].
nome(p-m, cao) --> [caes].
nome(p-m, gato) --> [gatos].
nome(s-m, cao) --> [cao].
nome(s-m, gato) --> [gato].
nome(s-m, futebol) --> [futebol].
nome(p-m, morango) --> [morangos].
nome(p-m, amendoim) --> [amendoins].
nome(p-m, bolacha) --> [bolachas].
nome(p-m, humano) --> [humanos].
nome(p-f, pessoa) --> [pessoas].
nome(p-m, homen) --> [homens].

verbo(s, jogar, S) --> [joga], {humano(S)}. % nota 1
verbo(p, jogar, S) --> [jogam], {humano(S)}. % nota 1
verbo(s, gostar, _) --> [gosta].
verbo(p, gostar, _) --> [gostam].
verbo(s, comer, _) --> [come].
verbo(p, comer, _) --> [comem].
verbo(p, ser, _) --> [sao].

%%%
% base de dados
%

humano(rapaz).
humano(rui).
humano(maria).
humano(rita).
humano(ana).
humano(luis).
humano(humano).
humano([]).
humano([H|T]) :- humano(H), humano(T).

jogar(rapaz, futebol).
jogar(rui, futebol).
jogar(pokemon, futebol).

gostar(luis, morango).
gostar(rita, morango).
gostar(ana, morango).
gostar(rui, maria).
gostar(cao, bolacha).
gostar(gato, bolacha).

comer(elefante, amendoim).

ser(rui, rapaz).
ser(X, humano) :- humano(X).


% 8.2
% extensão feita para 8.2 -> inclui sintagma verbal

%%%
% gramática
%
% ql is qualitative and qt is quantitative
pron_inter(_-_, ql) --> [quem].
pron_inter(p-_, qt) --> [quais].
pron_inter(p-m, qt) --> [quantos].
pron_inter(p-f, qt) --> [quantas].

pronome(_) --> [que].


% DCG

frase_i(Q, A, At, Ob) --> si(N, Q, At), sv(N, A, Ob, _).
si(N, Q, At) --> pron_inter(N-G, Q), sni(N-G, At).
si(N, Q, _) --> pron_inter(N-_, Q). % Q is ql or at
sni(N-G, At) --> determinante(N-G), nome(N-G, At), [que]. % get the attribute from the name
sni(N-G, _) --> nome(N-G, _).


% Example:
% frase_i(Q, A, At, Ob, [quem, gosta, de, morangos], []).
% Q = ql, A = gostar, At = _, Ob = morango
% frase_i(Q, A, At, Ob, [quantos, homens, gostam, de, morangos], []).
% Q = qt, A = gostar, At = homens, Ob = morango


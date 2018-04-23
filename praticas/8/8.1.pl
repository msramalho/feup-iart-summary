clear:-write('\33\[2J').
% 8

% 8.1

frase --> sn(N), sv(N).
sn(N) --> determinante(N-G), nome(N-G).
sn(N) --> nome(N-_).
sv(N) --> verbo(N, A), sn(_).


% Exemplos:
% frase([o,rui,joga,futebol], []). yes
% frase([os,rui,joga,futebol], []). no

%%%
% gramática
%

determinante(s-m) --> [o].
determinante(p-m) --> [os].
determinante(s-f) --> [a].

preposicao(_) --> [de].
preposicao(s-f) --> [da].

nome(p-m) --> [rapazes].
nome(s-m) --> [rapaz].
nome(s-m) --> [rui].
nome(s-m) --> [luis].
nome(s-f) --> [rita].
nome(s-f) --> [ana].
nome(s-f) --> [maria].
nome(s-m) --> [elefante].
nome(p-m) --> [caes].
nome(p-m) --> [gatos].
nome(s-m) --> [cao].
nome(s-m) --> [gato].
nome(s-m) --> [futebol].
nome(p-m) --> [morangos].
nome(p-m) --> [amendoins].
nome(p-m) --> [bolachas].
nome(p-m) --> [humanos].
nome(p-f) --> [pessoas].

verbo(s, jogar) --> [joga].
verbo(p, jogar) --> [jogam].
verbo(s, gostar) --> [gosta].
verbo(p, gostar) --> [gostam].
verbo(s, comer) --> [come].
verbo(p, comer) --> [comem].
verbo(p, ser) --> [sao].

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

%%%
% gramática
%

pron_inter(_-_) --> [quem].
pron_inter(p-_) --> [quais].
pron_inter(p-m) --> [quantos].
pron_inter(p-f) --> [quantas].

pronome(_) --> [que].

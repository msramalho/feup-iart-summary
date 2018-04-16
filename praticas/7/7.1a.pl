:-use_module(library(lists)).
clear:-write('\33\[2J'),retractall(facto(_,_,_)).
% 7.1

% a)

:- op(800, xfy, e).
:- op(950, xfx, entao).
:- op(850, fx, se).
:- op(750, xfx, com).

% R1
se motor=nao e bateria=ma entao problema=bateria com fc=1.
% R2
se luz=fraca entao bateria=ma com fc=0.8.
% R3
se radio=fraco entao bateria=ma com fc=0.8.
% R4
se luz=boa e radio=bom entao bateria=boa com fc=0.8.
% R5
se motor=sim e cheiro_gas=sim entao problema=encharcado com fc=0.8.
% R6
se motor=nao e bateria=boa e indicador_gas=vazio entao problema=sem_gasolina com fc=0.9.
% R7
se motor=nao e bateria=boa e indicador_gas=baixo entao problema=sem_gasolina com fc=0.3.
% R8
se motor=nao e cheiro_gas=nao e ruido_motor=nao_ritmado e bateria=boa entao problema=motor_gripado com fc=0.7.
% R9
se motor=nao e cheiro_gas=nao e bateria=boa entao problema=carburador_entupido com fc=0.9.
% R10
se motor=nao e bateria=boa entao problema=velas_estragadas com fc=0.8.

% b)

:- dynamic(facto/3).
% facto(Atributo, Valor, FatorCerteza).

% c)

questionavel(motor, 'O motor funciona?', [sim,nao]).
questionavel(luz, 'Como estao as luzes?', [fraca,razoavel,boa]).
questionavel(radio, 'Como esta o radio?', [fraco,razoavel,bom]).
questionavel(cheiro_gas, 'Sente cheiro a gasolina?', [sim,nao]).
questionavel(indicador_gas, 'Como esta o indicador de gasolina?', [vazio,baixo,meio,cheio]).
questionavel(ruido_motor, 'Que ruido faz o motor?', [ritmado,nao_ritmado]).

% verifica para o atributo A, qual o valor e qual o Fc
% 1ª hipótse, já tem um FC associado, no fator/3 ()
% 2ª hipótese

% 1ª o objectivo já existe como um facto.
verifica(A, V, FC):-
	facto(A, V, FC), !.
verifica(A, V, _):-
	facto(A, V2, _), V2 \= V, !, fail. % se houver algum atributo que partilha valores  falha

% 2ª o valor do atributo deve ser pedido ao utilizador (declare explicitamente quais os atributos a perguntar ao utilizador).
verifica(A, V, FC):-
	% perguntar o atributo e o fc ao utilizador
	questionavel(A, Perg, LR),
	write(Perg:LR), read(Val), % Val e não V, para guardar a informação, mesmo que não seja a que queremos
	write('Certeza[0-1]'), read(FC),
	% guardar o facto na base de conhecimento
	assert(facto(A, Val, FC)),
	!, V = Val. % verificar se teve sucesso ou não

% 3ª o objectivo pode ser deduzido a partir de regras existentes.
verifica(A, V, FC):-
	deduz(A, V, FC).



% MODELO DOS FACTORES DE CERTEZA
% m(H, E1 e E2)

deduz(A, V, _):-
	se Prems entao A=V com fc=FCRegra,
	prova(Prems, FCPrems),
	FCNovo is FCPrems * FCRegra,
	atualiza(A, V, FCNovo), % caso haja outra vai combinar segundo os FC
	fail. % ciclo baseado em falha para garantir que já não há mais regras para o par Atributo-Valor
deduz(A, V, FC):- % quando o de cima acaba (falha) devolve o que sabemos
	facto(A, V, FC).

% só tem E, portanto são só min(...)
prova(A=V, FC):-
	verifica(A, V, FC).
prova(A=V e PS, FC):-
	verifica(A, V, FC1),
	prova(PS, FC2),
	FC is min(FC1, FC2). % assumindo apenas conjunções nas regras

atualiza(A, V, FCNovo):-
	facto(A, V, FCVelho), !,
	retract(facto(A, V, FCVelho)),
	FC is FCNovo + FCVelho * (1 - FCNovo),
	assert(facto(A, V, FC)).
atualiza(A, V, FCNovo):-
	assert(facto(A, V, FCNovo)).


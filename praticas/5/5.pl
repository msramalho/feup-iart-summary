:-use_module(library(lists)).
:-use_module(library(between)).
clear:-write('\33\[2J').

slots(4).
disciplinas(12).
disciplina(1,[1,2,3,4,5]). % Os alunos 1,2,3,4,5 estão inscritos à disciplina 1
disciplina(2,[6,7,8,9]).
disciplina(3,[10,11,12]).
disciplina(4,[1,2,3,4]).
disciplina(5,[5,6,7,8]).
disciplina(6,[9,10,11,12]).
disciplina(7,[1,2,3,5]).
disciplina(8,[6,7,8]).
disciplina(9,[4,9,10,11,12]).
disciplina(10,[1,2,4,5]).
disciplina(11,[3,6,7,8]).
disciplina(12,[9,10,11,12]).

% a)
% número de alunos inscritos a duas disciplinas
incompat(D1, D2, Na):-
	disciplina(D1, LA1),
	disciplina(D2, LA2),
	findall(A, (member(A, LA1), member(A, LA2)), LA12),
	length(LA12, Na).

% b)
% avaliar uma solução no formato [Slot_Disciplina_1, Slot_Disciplina_2, Slot_Disciplina_3, ...]
% length(Solution, NDisciplinas)
% avalia([], 0).
f_aval(Solution, Score):-
	findall(
		Na,
		(
			nth1(D1, Solution, Slot),
			nth1(D2, Solution, Slot),
			D2 > D1, % originally was D1 \= D2, but this led to symetries
			incompat(D1, D2, Na)
		),
		LIncompat
	),
	sumlist(LIncompat, Score).

% DISCLAIMER: THIS IS NOT HILLCLIMBING, BUT RATHER GRADIENT DESCENT...that being said:


% hillclimbing versão steepest ascent
% hillclimbing_steepest([1,1,1,1,1,1,1,1,1,1,1,1], Sf). gets stuck in a local optimum: [3,1,1,4,4,4,1,3,2,2,2,3]:1
hillclimbing_steepest(S, Sf):-
	f_aval(S, Val),
	write(S:Val), nl,
	setof(
		TempVal-TempSol,
		(
			vizinho(S, TempSol),
			f_aval(TempSol, TempVal),
			TempVal < Val
		),
		Vizinhos
	),
	head(Vizinhos, V2-S2),
	write(S2:V2), nl,
	!,
	hillclimbing_steepest(S2, Sf).

% hillclimbing versão base (da aula)
% hillclimbing([1,1,1,1,1,1,1,1,1,1,1,1], Sf). finds the global optimum: [3,3,3,2,2,2,4,4,4,1,1,1]:0
hillclimbing(S, Sf):-
	f_aval(S, V),
	vizinho(S, S2),
	f_aval(S2, V2),
	V2 < V, % só quer os melhores
	!, % não desce a colina
	write(S2:V2), nl,
	hillclimbing(S2, Sf).


vizinho(S, Sv):-
	slots(NSlots),
	nth1(D, S, Slot),
	between(1, NSlots, NovoSlot),
	NovoSlot \= Slot,
	D1 is D - 1,
	length(S1, D1),
	append([S1, [_], S2], S),
	append([S1, [NovoSlot], S2], Sv).

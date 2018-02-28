% PAGE -> PEAS
% Perceptions Actions Goals Environment -> Perceptions Environmeant Actions

% Perceprions
t1: temperatura interior
t2: temperatura exterior

% Actions
AQ: ligar aquecedor
NAQ: desligar aquecedor
AC: ligar frio
NAC: desligar frio
AJ: abrir janelas
NAJ: fechar janelas

% Goals
 . 22 <= t1 <= t2
 . Minimizar gastos de energia (usar janelas)
 .


% Pseudocodigo

Se muito frio: AQ, NAC, NAJ
Se frio:
    Se t2 > t1 + 2: NAQ, NAC, AJ
    Se t2 <= t1 + 2: AQ, NAC, NAJ
Se normal: NAQ NAC NAJ
Se quente:
    Se t2 < t1 - 2: NAQ, NAC, AJ
    Se t2 >= t1 - 2: NAQ, AC, NAJ

% Escala
muito frio
20º
frio
22º
normal
24º
quente
26º
muito quente

% PROLOG
temp(int, 19).
temp(ext, 25).
estado(muito_frio):-temp(int, T), T < 20.
% acao(muito_frio, [aq, nac, naj]).
% acao(frio, [naq, nac, aj]):- temp(int, Tint), temp(ext, Text), Text > Tint + 2.
% acao(frio, [aq, nac, naj]).
faz(aq):-estado(muito_frio).
faz(naj):-estado(...).
fazer(L):-findall(F, faz(F), L).
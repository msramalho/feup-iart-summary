
<h1 align="center">Uncertain Reasoning</h1>

[back to index](../README.md)

## Fuzzy Sets

## Modelo dos Fatores de Certeza

### Rules for updating knowledge:
1. Combining evidences (E1 -> H, E2 -> H): 

`MB(H, E1 & E2) = MB(H, E1) + MB(H, E2) * (1 - MB(H, E1))`

2. Combining hypotheses: 

`MB(H1 & H2) = min(MB(H1), MB(H2))`

`MB(H1 | H2) = max(MB(H1), MB(H2))`

3. Chaining events: 

`MB(H, E) = MB'(H, E) * M(E)` where `MB'(H, E)` is the Measure of Belief in H, assuming E is true.


## Dempster-shafer

 * Crença - C - [0,1] crença atual num dado desfecho. Grau de confiança. 
 * Plausibilidade - P - o valor máximo que a crença numa dada hipótese ainda pode tomar `P = 1 - ~C`. 
 * Intervalo de confiança - [crença, plausibilidade]. 
 * Incerteza - 
 * Ignorância - `i=P-C` - Mede o que ainda não está fixo, quanto maior pior (menos informada) é a decisão num dado momento. Insuficiência de evidências, que se manifesta na distância entre C e P.
 * 

Combinar evidências `m1 e m2`:
 * Fazer tabela, intersetar e meter o produto das densidades de probabilidade. 
 * Usar a fórmula. Numerador -> interceção dá o evento, Denominador -> interseção dá conjunto vazio.
 <p align="center"><img src="https://latex.codecogs.com/gif.latex?Belief(C1)=\frac{\sum_{X\cap&space;Y\subseteq&space;\{C1\}}m1(x)*m2(y)))}{1-\sum_{X\cap&space;Y\subseteq&space;\{\phi&space;\}}m1(x)*m2(y)))}"/></p>

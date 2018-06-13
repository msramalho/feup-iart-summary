
<h1 align="center">Uncertain Reasoning</h1>

[back to index](../README.md)

## Fuzzy Sets

## Certainty Factor (Modelo dos Fatores de Certeza)

### Rules for updating knowledge:
1. Combining evidences (E1 -> H, E2 -> H): 

`MB(H, E1 & E2) = MB(H, E1) + MB(H, E2) * (1 - MB(H, E1))`

2. Combining hypotheses: 

`MB(H1 & H2) = min(MB(H1), MB(H2))`

`MB(H1 | H2) = max(MB(H1), MB(H2))`

3. Chaining events: 

`MB(H, E) = MB'(H, E) * M(E)` where `MB'(H, E)` is the Measure of Belief in H, assuming E is true.


## Dempster-shafer

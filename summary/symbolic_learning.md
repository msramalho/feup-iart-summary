# Symbolic Learning

[back to index](../README.md)

## Exercises Resolution steps
 1. Meter os comandos da Ti-nspire
```lua
r(x):=x.log2(x)
rr(x,y):=r(x)+r(y)
```
 2. Escrever a nomenclatura:
```
r(x) = x.log2(x)
r(x1,x2,...,xn) = sum(1,n)r(x)
```
 3. Definir as fórmulas (tudo em **bits** (exceto erro))
   * **ENTROPIA**: mede a **pureza** de um conjunto. 
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?H(C/a_k)=\sum_{j=1}^{M_k}p(a_{k,j})*[-\sum_{i=1}^{N}p(C_i|a_{k,j})*\log_2{p(C_i|a_{k,j})}]"/></p>
   
   
   * **informação média**: Se houver valores indefinidos, o denominador é decrementado (dá sempre o mesmo para todos os atributos a não ser que faltem valores).
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?info(C)=-\sum_{k=1}^{n}p(C_k)*\log_{2}(p(C_k))"/></p>
   
>Informação média para identificar Classes Ck no Conjunto C de itens (independente do Atributo)

   
   * **informação de separação**: infoS(A) - o que um dado atributo contribui para a separação da classe. Informação obtida dos resultados de um teste Tj com j=1 a n valores, independentemente de serem ou não da mesma classe. (Não confundir com info(C/Ai))
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?infoS(C)=-\sum_{i=1}^{n}\frac{C_i}{C}*\log_{2}(\frac{C_i}{C})"/></p>
   
   
   * **ENTROPIA de atributo A em relação à classificação no conjunto de treino C**:
   
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?info(C|A_i)=\sum_{j=1}^{n}\frac{Cj}{C}*info(C_j)"/></p>
   
   * **ganho de informação**: o que escolher um dado atributo trás de melhoria para a entropia:
   
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?G(C|A_i)=info(C)-info(C|A_i)"/></p>
   
   se faltar conhecer algum valor de um atributo (usar freq dos conhecidos sobre conhecidos + desconhecidos):
   
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?G(C|A_i)=f(known/total)*(info(C)-info(C|A_i))"/></p>
   
   > ECO: Dá bons resultados mas sobrevaloriza testes com muitos valores possíveis.
   
   * **razão do ganho**: Normalizar o ganho.
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?RG(A_i)=\frac{G(C|A_i)}{infoS(C)}"/></p>
   
   * **razão do erro**: (medida da **confiança** numa folha)`e` é o número de exemplos que não pertencem àquela folha e `n` é o número total de exemplos que acabam naquela folha. 
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?Re=\frac{e+1}{n+2}"/></p>
   
   

## ID3 
Algorithm for induction learning by [Ross Quinlan](http://www.rulequest.com/Personal/). Generates Decision Trees.
 * Uses **Entropy** as the decision variable for branching a given tree node, until it has 0 entropy.
 * Cannot handle unknown values
 * Cannot handle continue values (0.1 to 0.195), only discrete (0.1,0.2,0.3)
 * No further action taken to improve the results after the tree is ready

## C4.5
Improvement on ID3, Quinlan as well.
 * Uses **Gain Ratio** instead of Entropy
 * Can handle unknown values by extrapolating from the others
 * Can handle discrete values, by establishing interval values
 * Prunes (through pessimistic pruning) by removing trees that do not suficiently contribute to the accuracy of the model

 ## TP exercise
 
 ![image from TP classes](https://i.imgur.com/ZDgLbMC.png)

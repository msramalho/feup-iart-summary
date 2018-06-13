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
 3. Definir as fórmulas
   * **informação média** [entropia] mede a **pureza** de um conjunto. Para cada atributo -> das classes em que ele está. Se houver valores indefinidos, o denominador é decrementado. (dá sempre o mesmo para todos os atributos a não ser que faltem valores) -> somatório com os rácios de cada classe ->
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?info(C)=\sum_{i=1}^{n}p(c_i)*\log_{2}(p(c_i))"/></p>
   
   
   * **informação de separação**: Info_separacao(A) - o que um dado atributo contribui para a separação da classe. Somatório de `r(x)` para cada valor possível para o atributo (ignora a classe), caso um atributo tenha 1 ou mais valores indefinidos, esses contam como um valor extra ("indefinido")
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?info(a_i)=\sum_{i=1}^{n}p(a_i)*\log_{2}(p(a_i))"/></p>
   
   
   * **entropia de classificação** -> para cada atributo -> somatório dos produtos do rácio de um atributo em relação à classe e da distribuição dos valores desse atributo em relação a esse valor para o atributo
   
   
   <p align="center"><img src="https://latex.codecogs.com/gif.latex?E(C|a)=\sum_{j=1}^{M}p(a_j)&space;*&space;\sum_{i=1}^{n}p(c_i|a_j)*\log_{2}(p(c_i|a_j))"/></p>
   
   * **ganho**: o que escolher um dado atributo trás de melhoria para a entropia: `E(Classe) - E(Classe|atributo)`
   
   * **razão do ganho**: Normalizar o ganho. `RG(C|A)=Ganho(C|A)/info_separação(A)`
   
   * **razão do erro**: `e` é o número de exemplos que não pertencem àquela folha w `n` é o número total de exemplos que acabam naquela folha. 
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
 
 ## Entropy (aka Average information/Informação média)
 **H(S)** is a measure of the amount of uncertainty in the dataset S.
 
 ![](https://i.imgur.com/w8N4aiw.png)
 
 * S – The current (data) set for which entropy is being calculated (changes every iteration of the ID3 algorithm)
 * X – Set of classes in S
 * p(x) – The proportion of the number of elements in class x to the number of elements in set S
When H(S)=0, the set S is perfectly classified (i.e. all elements in S are of the same class).
 
 ## TP exercise
 
 ![image from TP classes](https://i.imgur.com/ZDgLbMC.png)

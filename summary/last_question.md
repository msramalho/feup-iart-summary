<h1 align="center">Last Question (actually 6 out of 7)</h1>

[back to index](../README.md)

## Rules of Conduct
 * The contributors are sorted by first commit on the question.
 * The question in each topic are sorted from most recent (newest) to least recent (oldest). If same topic and same year, then ascending order of `Question_number`
 * Answers may be improved
 * Different answers can be given
 * If possible upload missing PDFs to the [exams folder](../exames/)
 * Do not use big headings in answers
 * Avoid large images to make this printable

## Question and Answer Template:

```markdown
### 20XX/20YY - [Normal|Recurso] - Question_number [pdf](../exames/20XX_N.pdf) [TEMA]
#### Question:
This is the Question

#### Answer 1:
This is the first answer. If there is doubt then multiple can exist

[[source1](...), [source2](...)] by [@contributor_to_answer_1, @contributor_to_answer_2, ...]

---
```

---


# Topic 1 - Search Methods

### 2015/2016 - Normal - d) [pdf](../exames/2016_N.pdf) [ARREFECIMENTO SIMULADO]
#### Question:
No algoritmo de pesquisa por arrefecimento simulado, a aceitação de um novo estado depende da sua qualidade. Explique de que forma. 

#### Answer 1:
O agoritmo de arrefecimento simulado é um método de pesquisa para encontrar ótimos globais (**não é completo nem ótimo**, mas combate uma das limitações do hill climbing que é ficar preso em máximos locais). Caracterizado por considerar um valor de "temperatura" (que estabelece paralelismo com o arrefecimento de metais liquefeitos) e que vai diminuindo (arrefecendo) ao longo das iterações (tempo). Esse valor, doravente `T`, é usado para combater o problema "exploration vs exploitation", sendo que quanto menor é `T` maior é a probabilidade de a exploração ser beneficiada (face à potenciação), ou seja, `T` controla a probabilidade de selecionar estados que se afastam da melhor solução até ao momento. Quando `T=0` é retornado o valor atual. A fórmula que dita a probabilidade de aceitação de um estado é: 

<p align="center"><img heihgt="100px" src="https://latex.codecogs.com/gif.latex?p(x)=e^{\frac{\Delta_{h(x)}}{T}}"/></p>

Sendo `Δh = h(novo estado)- h(atual)` e `h(x)` é a função heurística de avaliação de um estado `x`. Para estados melhores que o atual, `Δh>0` e quanto maior `Δh` maior será `p(x)`. Para estados iguais ao atual, `Δh=0` => `p(x)=1` (aceita sempre). Para estados piores que o atual, `Δh<0` -> `p(x)<1` sendo que maior `T` faz com que o valor de `Δh` tenha menos efeito e aumenta a probabilidade.

De referir que, dado `p(x)` é tirado um número `r` à sorte entre 0 e 1 e se `p(x)>r`, `x` passa a ser o novo estado atual e repete-se o processo de procurar e avaliar estados até mudar, sendo que `T` vai diminuindo (variações não necessarieamente constantes).

Posto isto, a afirmação original torna-se mais clara: a aceitação de um dado estado depende da sua qualidade - quanto melhor é um estado (em relação ao estado em que se toma a decisão!), maior é a probabilidade de ele ser selecionado (maior `Δh` -> maior `p(x)`) - sendo que a probabilidade de aceitação diminui com o dito arrefecimento, `T`.
> Nota ECO: SE variação baixar T suficientemente devagar, +provável encontrar um ótimo global.

[] by [@msramalho]

---

### 2015/2016 - Normal - d) [pdf](../exames/2016_N.pdf) [ALFA-BETA]
#### Question:
Ao aplicar o algoritmo minimax, aplicaram-se os cortes alfa-beta indicados na figura (e só esses). Indique que gamas de valores podem ter os nós da folha.

<p align="center"><img height="150px" src="https://i.imgur.com/fQHhNBc.png"/></p>

#### Answer 1:
Descrever a figura: 
<p align="center"><img height="200px" src="https://i.imgur.com/xeKxUkd.png"/></p>

 * No ramo A, o valor da folha teria de ser >= 3, de forma a que `alpha >= beta`.
 * No ramo B, o valor da folha teria de ser <= 2, de forma a que `beta <= alpha`.
 * No ramo C, o valor de uma das folha teria de ser 2 e o da outra <= 2 (se não houvesse a restrição do 2 já na árvore, também podiam ir até 3), de forma a que `beta <= alpha`.

[] by [@msramalho]

---

### 2012/2013 - Recurso - b) [pdf](../exames/2013_R.pdf) [ALFA-BETA]
#### Question:
Considere a seguinte árvore de jogo, em que os valores das folhas representam a avaliação do jogo nesse estado. Assumindo que os nós são analisados da esquerda para a direita, indique quais os nós que não são avaliados quando se usa o algoritmo Minimax Alfa-Beta.

<p align="center"><img height="150px" src="https://i.imgur.com/OlGQysz.png"/></p>

#### Answer 1:
<p align="center"><img height="200px" src="https://i.imgur.com/PdYoEOm.png"/></p>

Não avaliados: O, I, T, U, Y

[] by [@msramalho]

---

### 2012/2013 - Recurso - a) [pdf](../exames/2013_R.pdf) [ARREFECIMENTO SIMULADO, HILL CLIMBING]
#### Question:
Comente a seguinte afirmação: “O algoritmo Arrefecimento Simulado, com uma temperatura constante positiva, é equivalente ao algoritmo Subir a Colina”. Como se comporta o algoritmo Arrefecimento Simulado quando o parâmetro temperatura é sempre igual a zero?

#### Answer 1:
(Ver [#20152016---normal---d-pdf-arrefecimento-simulado](#20152016---normal---d-pdf-arrefecimento-simulado) que descreve arrefecimento simulado)

Se, no arrefecimento simulado, a temperatura `T` for constante, a fórmula da probabilidade reduz-se a `e^(Δh/k)` que acaba por ser `e^Δh`. Nestas condições, temos ainda que quanto melhor um estado for maior será a probabilidade de ser o próximo e quanto pior for, menor também será essa probabilidade. Apesar de não haver uma tendência para arriscar menos à medida que as iterações aumentam, ainda existe o conceito de probabilidade, portanto a afiramação é **falsa**. 

No caso de `T=0`, contudo, temos que `e^(Δh/0)` que acaba por ser um número não real, mas se considerarmos como infinito (potência de divisão por 0) podemos derivar algumas conclusões. No caso de `Δh<0` (o estado é pior que o atual) teremos `p(x)=-∞` - os piores estados nunca são selecionados. Se o estado em consideração tiver o mesmo valor que o atual temos `0/0` o que acaba por ser uma indefinição e a intuição leva a crer que a probabilidade nesse caso seja considerada como nula. Caso contrário, teremos `Δh>0`, ou seja `p(x)=+∞`, nesse caso o estado será sempre selecionado. Portanto, perante `T=0` estamos perante o algoritmo de subir a colina, que avança apenas para estados de melhor valor. De realçar que há duas abordagens exclusivas no hill climbing: escolher o melhor ou expandir 1 a 1 até encontrar um melhor e que a implementação para a segunda opção era a que resultava de ter `T=0`, dado que não só se procuraria até a probabilidade ser 1 pela primeira vez.

[] by [@msramalho]

---

# Topic 2 - Evolutionary Algorithms


# Topic 3 - Uncertain Reasoning


# Topic 4 - Natural Language Processing (NLP)


# Topic 5 - Artificial Neural Networks (ANN)

### 2015/2016 - Normal - g) [pdf](../exames/2016_N.pdf) [RNN]
#### Question:
Construiu-se uma rede neuronal com **30** neurónios de entrada, 1 camada escondida com 20 neurónios, e 2 neurónios na camada de saída. Os neurónios de cada camada ligam a todos os neurónios da camada seguinte. Em termos teóricos, quantos exemplos de treino são necessários para que a rede consiga generalizar? 

#### Answer 1:
Se considerarmos o paralelismo entre arquitetura e treino de redes neuronais para com sistemas de equações, em que:
 1. o número de ligações independentes = nº variáveis
 2. nº saídas x nº exemplos = nº equações
 
Então, tentando verificar a equação `nº saídas x nº exemplos >= nº ligações independentes`, temos que `nº exemplos >= (nº ligações independentes / nº saídas)`. No caso concreto: `nº ligações independentes = 30*20 + 20*2 = 640`, ou seja, `NE >= (640/2) >= 320`. 

Em termos teóricos, são necessários pelo menos 320 exemplos de treino para que a rede consiga generalizar.

[[slide 42](https://web.fe.up.pt/~eol/IA/1718/APONTAMENTOS/7_RN_DL.pdf)] by [@msramalho]

---

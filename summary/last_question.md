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


### 2016/2017 - Recurso - a) [pdf](../exames/2017_R.pdf) [MONTECARLO TREE SEARCH, MINIMAX]
#### Question:
Explique duas vantagens do MCTS face ao Minimax.

#### Answer 1:
Vantagem 1: Não precisa de uma função de avaliação (o Minimax pode precisar se a profundidade for muito grande) dado que executa sempre jogos até ao fim e é em função disso que toma decisões, ou seja, só precisa de conhecer a mecânica de jogo e não de ter a noção do que é uma boa ou má jogada.  

Vantagem 2: Não é determinístico. Esta é uma vantagem face ao MM quando se fala de árvores muito grandes (nas quais o MM tem uma performance limitada por ser exaustivo). Ao fazer amostragens aleatórias o MCTS consegue criar estimativas do valor de cada estado - um exemplo flagrante disto é quando o minimax tem de ser restringido a uma profundidade tal que fica cego a alterações drásticas no valor dos estados, ao passo que o MCTS poderá vir a ter essa visão mais global. 

[] by [@msramalho]

---

### 2016/2017 - Normal - a) [pdf](../exames/2017_N.pdf) [A*, IDA*]
#### Question:
No IDA*, ao contrário do ID, aumenta-se o custo e não a profundidade. Como deve ser incrementado esse custo limite?

#### Answer 1:
O custo limite, para cada iteração do algoritmo IDA*, deverá tomar o valor do custo mínimo de todos os valores que excedem o custo limite, nesse momento. Formalizando, C(i+1) = min(all_values_exceding_C(i)).
  Se, por exemplo, na iteração i do algoritmo, o custo limite for 5 e os valores obtidos foram 7,8 e 10, então na iteração i+1, o custo limite será 7.

[[wikipedia](https://en.wikipedia.org/wiki/Iterative_deepening_A*#Description)] by [@LastLombax]

---


### 2015/2016 - Normal - a) [pdf](../exames/2016_N.pdf) [ARREFECIMENTO SIMULADO]
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

### 2014/2015 - Normal - c) [pdf](../exames/2015_N.pdf) [A*]
#### Question:
Explique as vantagens do algoritmo IDA* (Iterative Deepening) sobre o A*

#### Answer 1:
Como o A* tem de armazenar todos os estados encontrados até ao estado final, o algoritmo é bastante pesado a nível de memória utilizada. Apesar da qualidade da função heurísitica poder influenciar positivamente a complexidade temporal do A*, à medida que a escala (e espaço de pesquisa) aumentam, a utilização de IDA* torna-se mais viável de modo a reduzir a memória necessária. Isto deve-se ao facto do A* manter uma lista - tipicamente uma fila - de estados não visitados que rapidamente ocupam grandes níveis de memória. O IDA* mantém conhecimento apenas dos estados do caminho atual, de tal forma que a memória ocupada por essa lista aumenta linearmente apenas em relação ao tamanho da solução encontrada.

[[wikipedia](https://en.wikipedia.org/wiki/Iterative_deepening_A*)] by [@antonioalmeida]

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

### 2012/2013 - Recurso - b) [pdf](../exames/2013_R.pdf) [ALFA-BETA]
#### Question:
Considere a seguinte árvore de jogo, em que os valores das folhas representam a avaliação do jogo nesse estado. Assumindo que os nós são analisados da esquerda para a direita, indique quais os nós que não são avaliados quando se usa o algoritmo Minimax Alfa-Beta.

<p align="center"><img height="150px" src="https://i.imgur.com/OlGQysz.png"/></p>

#### Answer 1:
<p align="center"><img height="200px" src="https://i.imgur.com/PdYoEOm.png"/></p>

Não avaliados: O, I, T, U, Y

[] by [@msramalho]

---


### 2012/2013 - Recurso - c) [pdf](../exames/2013_R.pdf) [MINIMAX, EXPECTIMINIMAX]
#### Question:
Suponha agora que o adversário (representado nos níveis minimizadores) joga de forma aleatória (a probabilidade de efetuar qualquer jogada é a mesma). Como alteraria o algoritmo MiniMax se tivesse esta informação?

#### Answer 1:
Nestas condições, este deixa de ser um jogo de informação completa e passa a ser de informação perfeita (todos conhecem todo o estado do jogo) mas incompleta (parte do jogo depende do acaso). Posto isto, e sem necessidade de reinventar a roda, podemos considerar o expectiminimax de [Donald Michie](https://en.wikipedia.org/wiki/Donald_Michie) que é em tudo semelhante ao Minimax, exceto nas decisões que envolvem probabilidade, nessas a abordagem é fazer uma média pesada (sendo os pesos as respetivas probabilidades) e assumir que é esse o valor da jogada (esta aboradagem converge para a melhor jogada possível). Tendo em conta que a probabilidade de o oponente efetuar qualquer jogada seria a mesma, basta apenas considerar pesos iguais o que resulta numa média aritmética das jogadas possíveis.


[[wikipedia](https://en.wikipedia.org/wiki/Expectiminimax_tree)] by [@msramalho]

---

### 2012/2013 - Normal - b) [pdf](../exames/2013_N.pdf) [ITERATIVE IMPROVEMENT: HILL CLIMBING, SIMULATED ANNEALING]
#### Question:
Explique o que caracteriza os algoritmos de pesquisa local (iterative improvement). Dê dois exemplos de algoritmos deste tipo, explicando sucintamente as suas diferenças.

#### Answer 1:
Os algoritmos de pesquisa local caracterizam-se pelo uso de heurísticas que permitem, para cada novo estado, testar a proximidade à solução e seleccionar a melhor opção, ignorando as outras. Dois exemplos de algoritmos deste tipo são o algoritmo “Hill Climbing”, que selecciona sempre o estado mais próximo da solução e o algoritmo “Simulated Annealing”  que aceita, no início do processo de pesquisa da solução, algumas hipóteses mais afastadas da solução podem ser geradas, evitando ficar preso em máximos e mínimos locais.

[[slides 36-43](https://web.fe.up.pt/~eol/IA/1718/APONTAMENTOS/2MRPeAG.pdf)] by [@NadiaCarvalho]

---

### 2012/2013 - Normal - c) [pdf](../exames/2013_N.pdf) [MINIMAX, ALFA-BETA]
#### Question:
Na aplicação do algoritmo minimax com cortes alfa-beta, explique que papel pode ter a ordenação dos nós gerados e avaliados pela função de avaliação.

#### Answer 1:
A ordenação dos nós gerados e avaliados pela função de avaliação permite reduzir a complexidade temporal da aplicação do algoritmo minimax com cortes alfa-beta. No pior caso, se a ordenação for exatamente da pior para a melhor jogada, todos os nós serão visitados e não haverá cortes (minimax normal com complexidade temporal O(n^m)) e no melhor caso, quando consideramos sempre a melhor resposta primeiro e portanto, podemos imediatamente cortar todas as jogadas seguintes, piores do que a do estado a avaliar, temos complexidade temporal O(n^(m/2)). 

[[minimax](http://wiki.bethanycrane.com/minimax)] by [@NadiaCarvalho]

---

# Topic 2 - Evolutionary Algorithms


# Topic 3 - Uncertain Reasoning

### 2016/2017 - Normal - e) [pdf](../exames/2017_N.pdf) [Näive-Bayes]
#### Question:
Explique qual é o compromisso subjacente ao uso da fórmula Näive-Bayes.

#### Answer 1:
O compromisso associado à fórmula do Teorema de Bayes:

<p align="center"><img src="https://latex.codecogs.com/gif.latex?P(A|B)=\frac{P(B|A)*P(A)}{P(B)}"/></p>

é que pressupõe a independância entre os acontecimentos A e B e, como tal, estamos limitados a conclusões que assumem independência. Se tal não se verificar, as conclusões serão erradas. Um exemplo deste fenómeno é o de encontrar a palavra "viagra" e as palavras "blue pill" em emails e, no processo de os classificar em spam ou não, assumir que `P(viagra & bluepill) = P(Viagra) * P(bluepill)`, quando na verdade os emails que contém a palavra "viagra" costumam também conter "blue pill", de certa forma, a mesma informação acaba por ser contabilizada duas vezes. 


[[resumos scissored](https://drive.google.com/drive/folders/0B-EpxqiRLla0aldhS19CbVFBUDQ)] by [@LastLombax, @msramalho]

---


# Topic 4 - Natural Language Processing (NLP)


# Topic 5 - Symbolic Learning

### 2016/2017 - Recurso - c) [pdf](../exames/2017_R.pdf) [C4.5 INFORMAÇÃO DE SEPARAÇÃO]
#### Question:
No C4.5 para que serve a informação de separação?

#### Answer 1:
Uma das barreiras que o C4.5 ultrapassou face ao ID3 foi a de sobrevalorização de testes com muitos valores possíveis através da introdução da noção de razão do ganho face à medida do ganho. A razão do ganho, por sua vez, resulta do quociente entre o ganho de informação e a informação de separação - correspondendo portanto a uma medida normalizada do ganho. A razão pela qual o denominador é a informação de separação deve-se a este valor representar o que um dado atributo contribui para a separação da classe. Desta forma, o C4.5 permite que a comparação de atributos não seja enviesada para os que contêm muitos valores possíveis.

[[slide 76](https://web.fe.up.pt/~eol/IA/1718/APONTAMENTOS/6_ASA.pdf)] by [@msramalho]

---

### 2012/2013 - Normal - e) [pdf](../exames/2013_N.pdf) [SYMBOLIC vs SUBSYMBOLIC]
#### Question:
Em aprendizagem supervisionada, existem métodos simbólicos e métodos sub-simbólicos para a construção de modelos representativos dos exemplos pré-classificados. Indique o que distingue estes dois tipos de métodos e nomeie um exemplo de cada um deles.

#### Answer 1:
Estes dois tipos de métodos têm características muito diferentes, nomeadamente:
 * Simbólicos: Passam pela aprendizagem estruturada de nova informação simbólica. Focam-se na aquisição/extração de conhecimento. Têm como vantagens: regra geral, permitir uma mais fácil inspeção e explicação dos resultados, dado que é possível rastrear os passos que levaram a uma dada conclusão. Exemplo: Árvores de Decisão
 * Sub-simbólicos: Passa por refinar um procedimento através de tentativas sucessivas até atingir uma proximidade com o objetivo. Focam-se no refinamento de habilidades. Têm como vantagens: robustez face a ruído nos dados, melhor performance, menor necessidade de ter conhecimento de caso no início. Contudo, são mais difíceis de explicar, analisar e de fazer _debug_. Exemplo: Redes Neuronais

[[mit](http://futureai.media.mit.edu/wp-content/uploads/sites/40/2016/02/Symbolic-vs.-Subsymbolic.pptx_.pdf), [slide 3](https://web.fe.up.pt/~eol/IA/1718/APONTAMENTOS/6_ASA.pdf)] by [@msramalho]

---

# Topic 6 - Artificial Neural Networks (ANN)

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

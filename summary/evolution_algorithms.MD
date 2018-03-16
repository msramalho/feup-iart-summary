# Evolutionary Algorithms

[back to index](README.MD)

Previous years:
* [Exercise 2 2012](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2012_mt1.pdf) (only the problem)
* [Exercise 2 2013](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2013_mt1.pdf) (only the problem)

### 2017/2018
 * [Problem 1 - container](#problem-1---container) (with solution)
 * [Problem 2 - maximize function](#problem-2---maximize-function) (with solution)


### Problem 1 - container
Consider a container with **capacity = 100t**. Objects are represented as `(Object, Weight, Value)`.

* Objects:`(A, 10, 20)`, `(B, 70, 60)`, `(C, 30, 80)`, `(D, 80, 100)`
* The fitness function (_função de adaptação_) is: `f(Container_x) = Weight(Container_x) - Max(value[i]/weight[i])` for each `Object_i` **not in** Container_x. **OR** `f(Container_x) = 0` if Weight(Container_x) > 100
* Elististic strategy, with N = 1 (the 1 best subject is choosen for pairing automatically)
* 4 random numbers for pairing (_emparelhamento_): `0.6`, `0.9`, `0.09`, `0.2`
* **40%** chance of crossover (_cruzamento_) (only when the random number is below or equal to `0.4`) is the individual selected for crossover. The random numbers for crossover are: `0.6`, `0.9`, `0.1`, `0.2`, `0.8`
* Crossover point: between 2nd and 3rd bits
* Probability of mutation: 1%, only on the 10th RGN (randomly generated number) is a value smaller or equal to 0.01 generated.
* Initial Population:
   * `C1 = (0010)` (only object C)
   * `C2 = (1100)` (objects: A, B)
   * `C3 = (1110)` (A, B, C)
   * `C4 = (1001)` (A, D)
   * `C5 = (0110)` (B, C)

**Question:** Which objects to include in the container if there are only 2 generations.

**Answer:**

1. [_preprocessing_] Calculate `value[i]/weight[i]` for each object:
   * `A: 20/10  = 2`
   * `B: 60/70  = 0.85`
   * `C: 80/30  = 2.67`
   * `D: 100/80 = 1.25`
   (2, 0.85, 2.67, 1.25)

1. Caclulate the **fitness** of each individual (C1, C2, C3, C4, C5) (converting into int):
   * `C1: fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C2: fitness(1100) = [1 1 0 0] .* [10, 70, 30, 80] - max(2.67, 1.25) = 80 - 2.67 = 77.33 = 77`
   * `C3: fitness(1110) = [1 1 1 0] .* [10, 70, 30, 80] - max(1.25) = 110 | 110 > 100 => fitness(C3) = 0`
   * `C4: fitness(1001) = [1 0 0 1] .* [10, 70, 30, 80] - max(0.85, 2.67) = 90 - 2.67 = 87.33 = 87`
   * `C5: fitness(0110) = [0 1 1 0] .* [10, 70, 30, 80] - max(2, 1.25) = 100 - 2 = 98` <- **best of this generation** (only one choosen automatically because it is elitistic with N = 1)

1. Normalize the fitness into 0..1, by calculating the desired probability:

   Sum of fitnesses is: `28 + 77 + 0 + 87 + 98 = 290`
   * `p(C1) = 28/290 = 0.096`
   * `p(C2) = 77/290 = 0.266`
   * `p(C3) = 0/290 = 0`
   * `p(C4) = 87/290 = 0.3`
   * `p(C5) = 98/290 = 0.338`

1. Construct the **probability scale** (C3 does not appear):

    `0-----0.096-----------0.362-----------0.662-----------------1`

    `|----C1----|-------C2------|------C4-------|---------C5-----|`

1. **Selection** of 2nd generation using the RGNs: (`0.6`, `0.9`, `0.09`, `0.2`) using the scale:
   * C1' = **C5** = (0110) (elitistic)
   * C2' = C4 (`0.6`) = (1001)
   * C3' = C5 (`0.9`) = (0110)
   * C4' = C1 (`0.09`) = (0010)
   * C5' = C2 (`0.2`) = (1100)

1. Choose individuals for **crossover** from RGNs: `0.6`, `0.9`, `0.1`, `0.2`, `0.8`:
   Only (`0.1` and `0.2`) `<= 0.4` therefore only C3' and C4' are choosen for crossover.

1. Perform the **crossover** (in this case between the 2nd and 3rd bits):
    * `C3' = (01 10)` and `C4' = (00 10)`
    * `C3'' = (01 10)` and `C4'' = (00 10)`

1. After reproduction:
   * C1'' = (0110)
   * C2'' = (1001)
   * C3'' = (0110)
   * C4'' = (0010)
   * C5'' = (1100)

1. The **mutation** only happens on the 10th RGN => on the 10th bit, which is the second bit of **C3''**
   * C1'' = (0110)
   * C2'' = (1001)
   * C3'' = (0**0**10) <- mutation on the 2nd bit (overall 10th bit)
   * C4'' = (0010)
   * C5'' = (1100)

1. Recalculate the **fitness** function:
   * `C1'': fitness(0110) = [0 1 1 0] .* [10, 70, 30, 80] - max(2, 1.25) = 100 - 2 = 98` <- **best of this generation**
   * `C2'': fitness(1001) = [1 0 0 1] .* [10, 70, 30, 80] - max(0.85, 2.67) = 90 - 2.67 = 87.33 = 87`
   * `C3'': fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C4'': fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C5'': fitness(1100) = [1 1 0 0] .* [10, 70, 30, 80] - max(2.67, 1.25) = 80 - 2.67 = 77.33 = 77`

1. The **answer** is: Objects B and C will go into the container (the best individual of this generation is **C1'' = (0110)**)

---

### Problem 2 - maximize function
Consider a function: `f(x,y) = x^2 - y`, where:
* the goal is to find the values that maximize f
* `x in [0, 30]` and `y in [0.7]` (integers)
* RGN for **selection**: `0.8`, `0.4`, `0.2`, `0.6` (since there are 4 RGN and the population has size 4, then no element is choosen elitisticly from the 1st to 2nd generations)
* Initial population for `(x,y)`:
   * V1 = (15, 4)
   * V2 = (20, 5)
   * V3 = (8, 1)
   * V4 = (18, 3)
* crossover point between the 5th and 6th bits
* mutation probability is 1% and only on the 16th RGN (bit) a number `<= 0.01` appeared

**Question:** given that from the 2nd to the 3rd generation an elitistic strategy would be applied (N = 1), which individual would be selected for crossover?

**Answer:**

1. [_preprocessing_] Convert the decimal numbers (x and y) into binary values:
    * since `x in [0, 30]` then the number of bits required to represent x is 5: `2^5 = 32`
    * since `y in [0, 7]` then the number of bits required to represent y is 3: `2^3 = 8`

    So:
      * V1 = (15, 4) = (01111 100)
      * V2 = (20, 5) = (10100 101)
      * V3 = (8, 1)  = (01000 001)
      * V4 = (18, 3) = (10010 011)

1. Caclulate the **fitness** of each individual (V1, V2, V3, V4):
   * `V1: fitness(01111100) = f(15, 4) = 15^2 - 4 = 221`
   * `V2: fitness(10100101) = f(20, 5) = 20^2 - 5 = 395`
   * `V3: fitness(01000001) = f(8, 1)  =  8^2 - 1 = 63`
   * `V4: fitness(10010011) = f(18, 3) = 18^2 - 3 = 321`

1. Normalize the fitness into 0..1, by calculating the desired probability:

   Sum of fitnesses is: `221 + 395 + 63 + 321 = 1000`
   * `p(V1) = 221/1000 = 0.221`
   * `p(V2) = 395/1000 = 0.395`
   * `p(V3) =  63/1000 = 0.063`
   * `p(V4) = 321/1000 = 0.321`

1. Construct the **probability scale**:

    `0---------0.221------------------0.616----0.679------------------1`

    `|------V1------|----------V2----------|---V3---|---------V4------|`

1. **Selection** of 2nd generation using the RGNs: (`0.8`, `0.4`, `0.2`, `0.6`) using the scale:
   * V1' = V4 (`0.8`) = (10010011)
   * V2' = V2 (`0.4`) = (10100101)
   * V3' = V1 (`0.2`) = (01111100)
   * V4' = V2 (`0.6`) = (10100101)

1. Since no probabilities are given for **crossover**, the crossover can be done by pairing every two individuals (between the 5th and 6th bits):
    * V1' x V2' = (10010 011) x (10100 101)
        * V1'' = (10010 101) = (18, 5)
        * V2'' = (10100 011) = (20, 3)
    * V3' x V4' = (01111 100) x (10100 101)
        * V3'' = (01111 101) = (15, 5)
        * V4'' = (10100 100) = (20, 4)

1. The **mutation** only happens on the 16th RGN => on the 16th bit, which is the last bit of **V2''**
   * V1'' = (10010101)
   * V2'' = (1010001**0**) <- mutation on the last bit (overall 16th bit)
   * V3'' = (01111101)
   * V4'' = (10100100)

1. Recalculate the **fitness** function:
   * `V1'': fitness(10010101) = f(18, 5) = 18^2 - 5 = 319`
   * `V2'': fitness(10100010) = f(20, 2) = 20^2 - 2 = 398` **best**
   * `V3'': fitness(01111101) = f(15, 5) = 15^2 - 5 = 220`
   * `V4'': fitness(10100100) = f(20, 4) = 20^2 - 4 = 396`

1. The **answer** is: If an elitistic strategy is used from the 2nd to the 3rd generation, the individual choosen elitistically is **V2'' = (10100010) = (20, 2)**


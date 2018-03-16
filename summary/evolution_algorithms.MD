# Evolutionary Algorithms

Previous years: 
* [Exercise 2 2012](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2012_mt1.pdf)
* [Exercise 2 2013](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2013_mt1.pdf)

### 2017/2018
 * [Problem 1 - container](#problem-1---container)
 * [Problem 2 - maximize function](#problem-2---maximize-function)
 
 
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

1. [preprocessing] Calculate `value[i]/weight[i]` for each object:
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

1. Now, for the **mutation**, that only happens on the 10th RGN => on the 10th bit, which is the second bit of **C3''**
   * C1'' = (0110)
   * C2'' = (1001)
   * C3'' = (0**0**10) <- mutation on the 2nd bit (overall 10th bit)
   * C4'' = (0010)
   * C5'' = (1100)
   
1. Recalculate the **fitness** function:
(2, 0.85, 2.67, 1.25)
   * `C1'': fitness(0110) = [0 1 1 0] .* [10, 70, 30, 80] - max(2, 1.25) = 100 - 2 = 98` <- **best of this generation**
   * `C2'': fitness(1001) = [1 0 0 1] .* [10, 70, 30, 80] - max(0.85, 2.67) = 90 - 2.67 = 87.33 = 87`
   * `C3'': fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C4'': fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C5'': fitness(1100) = [1 1 0 0] .* [10, 70, 30, 80] - max(2.67, 1.25) = 80 - 2.67 = 77.33 = 77`
   
1. The answer is: Objects B and C will go into the container (the best individual of this generation is **C1''**)

---

### Problem 2 - maximize function

# Evolutionary Algorithms

Previous years: 
* [Exercise 2 2012](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2012_mt1.pdf)
* [Exercise 2 2013](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2013_mt1.pdf)

### 2017/2018

#### Problem 1
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

**Answer**

1. [preprocessing] Calculate `value[i]/weight[i]` for each object:
   * `A: 20/10  = 2`
   * `B: 60/70  = 0.85`
   * `C: 80/30  = 2.67`
   * `D: 100/80 = 1.25`
   
1. Caclulate the fitness of each individual (C1, C2, C3, C4, C5) (converting into int):
   * `C1: fitness(0010) = [0 0 1 0] .* [10, 70, 30, 80] - max(2, 0.85, 1.25) = 30 - 2 = 28`
   * `C2: fitness(1100) = [1 1 0 0] .* [10, 70, 30, 80] - max(2.67, 1.25) = 80 - 2.67 = 77.33 = 77`
   * `C3: fitness(1110) = [1 1 1 0] .* [10, 70, 30, 80] - max(1.25) = 110 | 110 > 100 => fitness(C3) = 0`
   * `C4: fitness(1001) = [1 0 0 1] .* [10, 70, 30, 80] - max(0.85, 2.67) = 90 - 2.67 = 87.33 = 87`
   * `C5: fitness(0110) = [0 1 1 0] .* [10, 70, 30, 80] - max(2, 1.25) = 100 - 2 = 98` <- **best of this generation**


# Evolutionary Algorithms

Previous years: 
* [Exercise 2 2012](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2012_mt1.pdf)
* [Exercise 2 2013](https://github.com/msramalho/feup-iart-summary/blob/master/minitestes/2013_mt1.pdf)

### 2017/2018

#### Problem 1
Consider a container with **capacity = 100t**. Objects are represented as `(Object, Weight, Value)`.

* Objects:`(A, 10, 20)`, `(B, 60, 70)`, `(C, 30, 80)`, `(D, 80, 100)`
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

1. asd


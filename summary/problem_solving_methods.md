<h1 align="center">Problem Solving Methods</h1>

[back to index](../README.md)

Minitest1 (at the end):
 * [Problem 1 - weak methods](#problem-1---weak-methods)
 * [Problem 2 - A*](#problem-2---a)
 * [Problem 3 - minimax alpha-beta](#problem-3---minimax-alpha-beta)

# Relevant Exam stuff
#### Heurística Admissível
A heuristic function is said to be admissible 
#### Heurística Consistente
heuristic function is said to be consistent, or monotone, if its estimate is always less than or equal to the estimated distance from any neighboring vertex to the goal, plus the step cost of reaching that neighbor.

Formally, for every node N and each successor P of N, the estimated cost of reaching the goal from N is no greater than the step cost of getting to P plus the estimated cost of reaching the goal from P. That is:

    h ( N ) ≤ c ( N , P ) + h ( P ) {\displaystyle h(N)\leq c(N,P)+h(P)} h(N)\leq c(N,P)+h(P) and
    h ( G ) = 0. {\displaystyle h(G)=0.\,} h(G)=0.\, 

1.  The general search algorithm
    

    *   **Problem-solving agents**: find sequence of actions that achieve goals.
    *   Operators **expand** a state: generate new states from present ones.
    *   **search strategy**: tells which state to expand next.
    *   **fringe** or **frontier**: discovered states to be expanded
    
2.  Some search strategies:
    1.  Evaluation criteria:
        1.  **completeness**: will it find a solution if one exists?
        2.  **time efficiency**:
        3.  **space efficiency**:
        4.  **optimality of solution**:
    2.  **Uninformed** or **blind** searches:
        1.  **Breadth-first**: (FIFO queuing strategy)
            *   complete: yes
            *   time and space: O(branch_factor^depth) (empirically space a larger problem than time)
            *   optimality: yes, if path cost non-decreasing with depth.
        2.  **Uniform Cost** (expand lo cost fringe node)
            *   optimal: yes, if no negative costs
            *   a generalization of **Breadth-first**.
        3.  **Depth-first** (uses a stack)
            *   completeness: no! may go down and not come back
            *   time: O(branch_factor^depth)
            *   space: O(depth)
            *   optimality: no! returns first found, not necessarily ideal
        4.  **depth-limited** (DFS down to some cutoff)
            *   completeness: yes, provided solution exists before cutoff
            *   time: O(branch\_factor^depth\_limit)
            *   space: O(depth_limit)
            *   optimality: no!
        5.  **Iterative Deepening** (successively increasing depth-limited)
            *   **diameter of state space**: max anticipated path length for most problems.
            *   completeness: yes (like Breadth-first)
            *   time: O(branch_factor^diameter)
            *   space: O(diameter) (like Depth-first)
            *   optimality: yes (like Breadth-first)
    3.  **Informed** searches:
        1.  **Best-first search** (expand nodes according to some cost function)
            1.  **Greedy search** (expand according to h(n)--cost to goal)
                *   completeness: no (could go down an endless branch)
                *   optimality: no (ignores cost from initial node)
                *   faster (on average) than uninformed algorithm
            2.  **A* search** (combines uniform-cost search and greedy search)
                *   expand nodes according to the estimated total cost function, f(n) = g(n) + h(n)
                *   h(n) must always be optimistic (admissible)
                *   completeness: yes
                *   optimality: yes
                *   optimally efficient: no better algorithm with same knowledge
        2.  **Heuristic functions**
            *   Relax the demands of the problem
            1. Admissible
                *   it never overestimates the cost of reaching the goal, i.e. the cost it estimates to reach the goal is not higher than the lowest possible cost from the current point in the path - optimistic nature.
            2. Consistent
                *   it estimates always less than or equal to the estimated distance from any neighboring vertex to the goal, plus the step cost of reaching that neighbor.
                
                    <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/13f0aab8aafdf18e5e20ea1e069be091526b08f6" />, N is any node in the graph and P is any descendant of N.

            

---


## Production Systems
Systems that describe a set of rules (*productions*) about behaviour. It represents a mechanism of goal finding through _if-then rules_ or _condition-action rules_ or _situation-action rules_ or just _productions_. Eg: Knowledge Based Systems (KBS).


## Solution Searching Methods
  1. [Weak Methods](#weak-methods)
      * Generic search techniques
      * Subject to combinatorial explosion
  2. [Informed Methods](#informed-methods)
      * Have some sort of prior knowledge about the problem
 
 
## Weak Methods
#### Search Direction
  * Forward Chaining - start from the data/premisses and move towards the objectives/conclusions. 
    * Good when the number of objectives is large
    * eg: Symbolic Integration (moves from the integral form and finds the derivative, the opposite would not make sense)
  * Backward Chaining - start from the objectives/conclusions and move towards the data/premisses
    * Good when the number of objectives is small
    * eg: Theorem prover (moves from the theorem and find the axioms, otherwise many theorems could be derived from a set of initial axioms)

#### State Representation
Should be choosen individually for each problem.
 1. Graph
 2. Tree
 
 ##### Framing Problem
 The problem of efficiently representing a state or a state sequence. Many approaches exist and the answer varies from problem to problem:
  * Record every state
  * Record initial state and further changes from that
  * Record the current state and the steps needed to go back to the previous states
 Faces the problem of representing things that change as a colateral effect. Eg: Turning a glass of water upside down has the colateral effect of spilling the water.

#### Cost Functions
Used to represent the value of a given state in accordance to the desired goal.

 
Either can be transformed into the other by increasing (Graph -> Tree) or decreasing (Tree -> Graph) the number of nodes.

### Algorithms for Week Methods
 * Generate and Test
 * Depth-first Search
 * Breadth-first Search
 * Backtracking
 * Branch and Bound
 * Hill Climbing
 * Simulated Annealing
 * Genetic Algorithms
 * Decomposition
 * Constraint Satisfaction
 * Means-Ends Analysis

##### Generate and Test
Genereates a potential solution (exhaustively) and tests it for a real solution.

##### Depth-first Search
<table>
  <tr>
    <td><img width="300" float="right" src="https://upload.wikimedia.org/wikipedia/commons/1/1f/Depth-first-tree.svg"/></td>
  <td>Transverses a Search Tree or Graph by exploring all the child nodes of the current node, and only backtracks when a leaf/node with no unexplored chil is found.</td>
  </tr>
</table>

##### Breadth-first Search

<table>
  <tr>
    <td><img width="300" float="right" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Breadth-first-tree.svg/300px-Breadth-first-tree.svg.png"/></td>
  <td>Transverses a Search Tree or Graph by exploring all the nodes at a given level, before proceeding to their children at deeper levels</td>
  </tr>
</table>

##### Backtracing
<table>
  <tr>
    <td><img width="300" float="right" src="https://upload.wikimedia.org/wikipedia/commons/8/8c/Sudoku_solved_by_bactracking.gif"/></td>
  <td>Search technique that proceeds the search untill a soution is proved to not be possible along that path, it then takes back steps, one a time, until it finds another node that does not impede a solution and delves into that path, repeating the process</td>
  </tr>
</table>

##### Branch and Bound

##### Hill Climbing

##### Simulated Annealing

##### Genetic Algorithms

##### Decomposition

##### Constraint Satisfaction

##### Means-Ends Analysis


---

# Minitest 1

### Problem 1 - weak methods
Comapre in terms of complexity and characteristics the search strategies of: **depth first search** (dfs), **breadth first search** (bfs), **iterative deepening** (id):

|     | Time complexity                                                            | Space complexity                                                           | Complete  (guaranteed to find a solution) | Optimal (guaranteed to find the best solution) |
|-----|----------------------------------------------------------------------------|----------------------------------------------------------------------------|-------------------------------------------|------------------------------------------------|
| dfs | r^m                                                                        | r * m (if it expands all sucessors before choosing the first), m otherwise | no                                        | no                                             |
| bfs | r^(p+1) (because it expands all the successors before navigating sideways) | same as time complexity (r^(p+1))                                          | yes                                       | yes (if the utility is the length of the path) |
| id  | r^p (because it does not expand the next successors)                       | same as dfs space complexity (r * m if...)                                 | yes                                       | yes (if the utility is the length of the path) |

### Problem 2 - A*
Problem from figure 2.2 in [Intelligent Systems for Engineering: A Knowledge-based Approach](https://books.google.pt/books?id=hZLwBwAAQBAJ&pg=PR1#v=onepage&q&f=false). 

**Question:** Using A* on the field lots, what is the content of the `openList` and `closedList` right after node **4** is expanded? How is the next node choosen in A*?

**Answer:** `openList = [2,5,6]` and `closedList = [1,3,4]`. A* chooses the next node from `openList` that has the lowest **f*** value. Or the left one, if they have the same **f*** values.

<p align="center">
  <img src="/minitestes/images/a_star.png" height="500">
</p>

### Problem 3 - minimax alpha-beta

**Question:** Given a tree of `r = 2` (branching factor) and  `m = 2` (tree depth), with node values of 5,3,2,7, what are the values of α and β for each tree node and specify if all the tree nodes are visited.

**Answer:** node with value `7` is cut and the values of α and β can be visualized [here](http://nmiljkovic.github.io/minimax/#tree=KCg1LDMpLCgyLDcpKQ%3D%3D). 




<h1 align="center">Problem Solving Methods</h1>

[back to index](README.MD)

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

### Algoruthims for Week Methods
 * Generate and Test
 * Depth-first Search
 * Breadth-firts Search
 * Bracnh and Bound
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

##### Breadth-firts Search

<table>
  <tr>
    <td><img width="300" float="right" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Breadth-first-tree.svg/390px-Breadth-first-tree.svg.png"/></td>
  <td>Transverses a Search Tree or Graph by exploring all the nodes at a given level, before proceeding to their children at deeper levels</td>
  </tr>
</table>

##### Bracnh and Bound

##### Hill Climbing

##### Simulated Annealing

##### Genetic Algorithms

##### Decomposition

##### Constraint Satisfaction

##### Means-Ends Analysis


## Informed Methods

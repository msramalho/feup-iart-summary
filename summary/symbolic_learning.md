# Symbolic Learning

[back to index](../README.md)

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
 
 ## Entropy:
 **H(S)** is a measure of the amount of uncertainty in the dataset S.
 
 ![](https://i.imgur.com/w8N4aiw.png)
 
 * S – The current (data) set for which entropy is being calculated (changes every iteration of the ID3 algorithm)
 * X – Set of classes in S
 * p(x) – The proportion of the number of elements in class x to the number of elements in set S
When H(S)=0, the set S is perfectly classified (i.e. all elements in S are of the same class).
 
 
 ![](https://i.imgur.com/ZDgLbMC.png)

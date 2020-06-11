# Finding Minimum Cost Between Two Nodes in Graph
This program traverses the graph G provided below and determines the least costly path to take, between two user selected nodes in graph G. Each node to node path has a numerical value that contributes to the overall cost of the path. 

## Graph G
![alt text][graphG]

[graphG]: https://github.com/jpildush/Artificial-Intelligence/blob/master/Prolog/Minimum%20Cost%20Path/graphGminpath.jpeg "Graph G"

## Executing Program
1. Compile and run program: ``` swipl minPath.pl ```
2. Start the program: ``` start. ```
3. Follow the prompt and enter the start node: i.e. ``` a. ```
4. Follow the prompt and enter the end node: i.e. ``` d. ```

* The Path from a to d: [a,b,c,d] - Cost is 6
* Another example b->d results in The Path from b to d: [b,c,d] - Cost is 3

**One search between the two user inputted nodes generates multiple unique paths, each with different costs.**

**The path that requires the least cost will be the resulting path, displayed as a list.**

 

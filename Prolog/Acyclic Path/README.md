# Finding the Acyclic Path in a Graph of Nodes
This program determines the Acyclic Path P between two nodes, in the graph G. The resulting path is displayed as a list.

##  What is an Acyclic Path?
An Acyclic Path is one that does not have a repeating cycle. In this case for the Acyclic Path in the graph G, the resulting path would not have any repeating nodes.

## Executing Proogram
**Open up Terminal/Power Shell and navigate to the directory with acyclicPath.pl**

1. Compile and run program: ``` swipl acyclicPath.pl ```
2. Start the program: ``` start. ```
3. Follow the prompt and enter a graph to be used for the Acyclic Path: i.e. ``` graph([(a,b),(b,c),(c,d),(d,c),(c,b),(b,a)]. ```
  * **The given graph has been designed to also provide a backwards traversal. This means that traversal between D and A would be possible.**
  * **It is important to consider the design of the graph. In order for the graph to traverse, there must be designated connections between nodes, otherwise the search may fail.**
  * **Another example of a graph:** ```graph([(a,b),(b,d),(b,c),(c,d),(d,c),(c,a),(c,b),(b,a)]. ```

4. Follow the prompt and enter the start node: i.e. ``` a. ```
5. Follow the prompt and enter the end node: i.e. ``` d. ```
**The result of the Acyclic Path search would be the path:** ``` [a->b->c->d] ```
**The result of the Acyclic Path search of the second example graph, between nodes A and D would be:** ``` [a->b->d] ```

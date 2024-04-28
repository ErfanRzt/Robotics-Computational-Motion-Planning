![Static Badge](https://img.shields.io/badge/Coursera-University_of_Pennsylvania-blue?logo=coursera)
![Static Badge](https://img.shields.io/badge/MATLAB-R2022a-orange)

<div align="justify">

# Robotics: Computational Motion Planning
The University of Pennsylvania offers the MOOC [**Robotics: Computational Motion Planning**](https://www.coursera.org/learn/robotics-motion-planning?specialization=robotics) which is available on Coursera. The course is self-paced and instructed by [CJ Taylor](https://www.grasp.upenn.edu/people/camillo-j-taylor/). It is also part of the [**Robotics Specialization**](https://www.coursera.org/specializations/robotics).

This repository showcases my progress in this course. However, I must adhere to the rules and guidelines set by the Coursera Honor Code, which prohibit me from providing complete answers to the quizzes and computer assignments. As a result, this repository only includes general summaries of the course topics, descriptions of the assignments, and the final results and procedures.

Nevertheless, I am more than willing to offer assistance and support to other students or enthusiasts privately. If you have any questions or need guidance, please don't hesitate to reach out to me. Additionally, I am particularly enthusiastic about collaborating on robotics systems, specifically motion planning problems and other topics covered in this course. Whether it's providing help or being part of a larger team, I would be thrilled to contribute to solving these challenges.

## Introduction
Robotic systems typically include three components: a mechanism which is capable of exerting forces and torques on the environment, a perception system for sensing the world, and a decision and control system that modulates the robot's behavior to achieve the desired ends.  In this course, we will consider the problem of how a robot decides what to do to achieve its goals. This problem is often referred to as Motion Planning and it has been formulated in various ways to model different situations.  You will learn some of the most common approaches to addressing this problem including graph-based methods, randomized planners, and artificial potential fields.  Throughout the course, we will discuss the aspects of the problem that make planning challenging.

## Basic Problem
The goal of defining a basic motion planning problem is to isolate some central issues and investigate them in depth before considering additional difficulties.

In the basic problem, we assume that the robot is the only moving object in the workspace and we ignore the dynamic properties of the robot, thus avoiding temporal issues. We also restrict motions to non-contact motions, so that the issues related to the mechanical interaction between two physical objects in contact can be ignored. These assumptions essentially transform the "physical" motion planning problem into a purely geometrical path planning problem. We simplify even further the geometrical issues by assuming that the robot is a single rigid object, i.e. an object whose points are fixed with respect to each other. The motions of this object are only constrained by the obstacles.

## `WEEK 1`&nbsp; Graph-Based Motion Planning
Motion planning methods transform a "continuous" problem into a "discrete" problem of searching a graph between an initial node and a goal node. Various methods have been developed for searching graphs. In the following, the goal is to construct a path, usually the shortest, through the grid/ graph from the start to the goal. 

### Dijkstra
The algorithm operates by maintaining a priority queue of nodes, initially containing only the starting node. It assigns a tentative distance value to each node, representing the shortest known distance from the starting node to that node. The algorithm then iteratively selects the node with the smallest tentative distance and explores its neighboring nodes. It updates the tentative distances of these neighbors if a shorter path is found. This process continues until all nodes have been visited or the shortest path to the target node is found.

Dijkstra's algorithm guarantees finding the shortest path in a graph with non-negative edge weights. Also, The algorithm's time complexity is generally dependent on the number of nodes and edges in the graph, making it efficient for sparse graphs.

### A* Algorithm
A* algorithm is an extension of the former algorithm. Dijkstra search in a sense is uninformed, in that the search moves through the graph without any preference for or influence on where the goal node is located. For example, if the coordinates of the goal node are known, then a graph search can use this information to help decide which nodes in the graph to visit (i.e., expand) to locate the goal node. Alas, although we may have some information about the goal node, the best we can do is define a heuristic that hypothesizes an expected, but not necessarily actual, cost to the goal node. For example, a graph search may choose as its next node to explore one that has the shortest Euclidean distance to the goal because such a node has the highest possibility, based on local information, of getting closest to the goal.

The A∗ algorithm searches a graph efficiently, with respect to a chosen heuristic. Also, A∗ will always terminate, ensuring completeness. 

There are variations or special cases of A∗ in which the search becomes a greedy search because the search is only considering what it “*believes*” is the best path to the goal from the current node. As you may notice, *Dijkstra* Algorithm is When the planner is not using any heuristic information but rather growing a path that is shortest from the start until it encounters the goal.

### Assignment
In this assignment, I worked on writing Matlab code to implement planning systems that work on 2D grid-like environments. For both sections, the input map was specified as a 2D logical array where the false or zero entries correspond to free cells and the true or non-zero entries correspond to obstacle cells. The goal of these planning routines was to construct a route between the specified start and destination cells.

<div align="center">
  
| <img src=".\Figures\WEEK1\djkstra.gif" alt="djkstra" width="500"/> |
|:--:| 
| The Classic <b>Dijkstra’s Algorithm</b> |

</div>

<div align="center">
  
| <img src=".\Figures\WEEK1\astar.gif" alt="astar" width="500"/> |
|:--:| 
| <b>A* Algorithm</b> with Euclidean Heuristic Function |

</div>


## `WEEK 2`&nbsp; Configuration Space
<div align="center">
  <img src=".\Figures\WEEK2\twolink-cspace-equal.jpg" alt="configuration-space" width="500"/>
</div>

<div align="center">
  <img src=".\Figures\WEEK2\dijkstratour.jpg" alt="twolink-dijkstra" width="500"/>
</div>

<div align="center">
  <img src=".\Figures\WEEK2\dijkstratour-animation.gif" alt="twolink-dijkstra-animate" width="500"/>
</div>


## `WEEK 3`&nbsp; Probabilistic Road Map
<div align="center">
  <img src=".\Figures\WEEK3\sixlink-prm.gif" alt="sixlink-prm" width="500"/>
</div>


## `WEEK 4`&nbsp; Artificial Potential Fields
<div align="center">
  <img src=".\Figures\WEEK4\configuration-space.jpg" alt="twolink-dijkstra-animate" width="500"/>
</div>

<div align="center">
  <img src=".\Figures\WEEK4\artificial-potential-fields.gif" alt="twolink-dijkstra-animate" width="500"/>
</div>

<div align="center">
  <img src=".\Figures\WEEK4\quiver-plot.jpg" alt="twolink-dijkstra-animate" width="500"/>
</div>


## Resources
If you are interested in the topic of computational motion planning in robotics, here are some related texts:

- [Robot Motion Planning](http://link.springer.com/book/10.1007%2F978-1-4615-4022-9), 
  Jean-Claude Latombe,  Kluwer Academic Publishers, 1991.

- [Principles of Robot Motion](https://mitpress.mit.edu/books/principles-robot-motion), 
  H. Choset, K. M. Lynch, S. Hutchinson, G. Kantor, W. Burgard, L. E. Kavraki and S. Thrun, MIT Press, Boston, 2005. 

- [Planning Algorithms](http://msl.cs.uiuc.edu/planning/index.html), 
  Steven M. LaValle, Cambridge University Press, 2006.


## Certificate
<div align="center">
  <img src=".\Figures\Erfan-Riazati-Certificate.png" alt="twolink-dijkstra-animate" width="750"/>
</div>


## Coursera Honor Code
Here are the key points of the Coursera Honor Code summarized in bullet points:

- Complete all assignments and exams on your own without unauthorized assistance.
- Do not share or distribute course materials, including assignments or exams, without explicit permission.
- Be honest in all academic interactions, including discussions and collaborations with other learners.
- Properly attribute and cite any external sources used in your work.
- Adhere to the specific policies and guidelines outlined by each course and instructor.

It's important to note that these points are a general summary, and you should refer to the specific honor code provided by Coursera for more detailed information. You’ll find the entire Coursera Honor Code [here](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US).

</div>

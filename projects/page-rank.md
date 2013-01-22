---
layout: page
title: Page Rank
header: Page Rank
group: projects
---
{% include JB/setup %}

#### Context  
Applied math and probability project for discrete math/theoretical foundations of computer engineering (CprE 310).

#### Technologies used
Java

#### Skills acquired
Creating configurable packaged Java applications runnable from the command line; understanding of the basic PageRank algorithm, automated program performance testing  

My compiled code can be found [here](/files/pagerank.jar).  

This was a free-form programming project in which I was to design an implementation of the PageRank algorithm to run on edge files, which contain two whitespace-delimited node indices per line, where each line is a directed edge from the first index to the second index. I chose to implement the traditional iterative version of PageRank, but opted to implement a Monte Carlo simulation in order to compare results between the different representations of popularity of a particular page. I enjoyed configuring this as a command line utility, providing various optional arguments to the user that configured the variables in the algorithms. As no specification was given as to how to accomplish this implementation, I researched the algorithm and processed simple examples by hand in order to ensure my understanding of its functionality. I wrote out simple pseudocode of a linked node graph implementation, set up my class structure, and then fleshed out the code. In order to ensure the accuracy of my implementation, I compared my results to my own hand calculated examples, an online PageRank calculator, and the results of my peers' independent implementations. I wrote a generator class to produce random edge files of provided specifications that allowed automation of performance testing. This project demonstrated to me the apparent difficulty of retrieving relevant searches on massive-scale data.  

My project presentation, with more complete details and analysis is embedded below.  

<iframe src='http://docs.google.com/presentation/embed?id=1nqraY48b-qWWEnRMzABtTpDZ8RgvKGP9R_N-D71Dmus&amp;start=false&amp;loop=false&amp;delayms=3000' frameborder="0" width="960" height="749" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"> </iframe>


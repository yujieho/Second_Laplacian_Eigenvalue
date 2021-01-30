<h1 align="center">The Second Laplacian Eigenvalue</h1>
<div align="center"><i>A survey on the second smallest Laplacian eigenvalue  <img src="readmeimg/Picture0.png" height="30" />  and its applications.</i></div>
<br>

This project reveals the relationship between  <img src="readmeimg/Picture1.png" height="30" /> and the connectivity of a graph.



## Contents
- [Introduction](#Introduction)

    - [Normalized Laplacian](#Normalized-Laplacian)
    - [Eigenvalue of Normalized Laplacian](#Eigenvalue-of-Normalized-Laplacian)
    - [Conductance of Graph](#Conductance-of-Graph)
    - [Cheeger's Inequality](#Cheeger's-Inequality)

- [Small](#Small)  <img src="readmeimg/Picture0.png" height="30" /> 

    - [Introduction](#Introduction)
    - [Image Partition](#Image-Partition)

- [Large](#Large)  <img src="readmeimg/Picture0.png" height="30" /> 

    - [Introduction](#Introduction)
    - [The Marguli-Gabber-Galil Expander](#The-Marguli-Gabber-Galil-Expander)
    - [The Zig-Zag Product](#The-Zig-Zag-Product)

- [References](#References)



## Introduction


### Normalized Laplacian

	<p align='center'><img src="readmeimg/Picture7.png" height="50" /></p>   where *A* is the adjacency matrix and *D* is a diagonal matrix with degree of vertices on its diagonal.  

 - Symmetric, singular, positive semidefinite. 

 - Measure the smoothness of a vector *x*.  



### Eigenvalue of Normalized Laplacian

 -  Eigenvalues are between 0 and 2.  

 - The smallest eigenvalue of Laplacian is always equal to 0, and its eigenvector is the all-one vector.

 - The multiplicity of the 0 eigenvalue is equal to the number of connected component a graph has.  

 -  
	<img src="readmeimg/Picture1.png" height="100" />

 -  The second smallest eigenvalue is 0 iff the graph is disconnected.
<p align='center'><img src="readmeimg/Picture2-2.png" height="200" /></p>  

6. The largest eigenvalue is 2 iff a graph is bipartite.  




### Conductance of Graph

1. For a graph *G* = (*V*,*E*), conductance of a vertex subset *S* is (number of boundary of *S*) / min( number of vertex in *S*, number of vertex in *V-S* ).  
<p align='center'>
    <img src="readmeimg/Picture3.png" height="200" />
    <img src="readmeimg/Picture4.png" height="40" />

</p>

2. Conductance of a graph is the smallest conductance of a vertex subset *S* with size < |*V*| / 2 .  



### Cheeger's Inequality

<p align='center'><img src="readmeimg/Picture5.png" height="40" /></p>  

Right side indicates:  
1. Small  <img src="readmeimg/Picture0.png" height="100" />  implies small conductance.  
2.  Small conductance implies its corresponding eigenvector is a good cut.  

<img>  

Left side indicates:  
1. Large  <img src="readmeimg/Picture0.png" height="30" />  implies large conductance.  
2. Large conductance implies that the graph is well-connected and is an expander.  





## Small <img src="readmeimg/Picture0.png" height="50" /> 

### Introduction

Intuitively, graphs that can be easily divided into two have small  <img src="readmeimg/Picture0.png" height="30" />   :
<img>  


Surprisingly, planar graphs also have small  <img src="readmeimg/Picture0.png" height="30" />  [3] :
<img>


This fascinating property of planar graphs lead me to the next topic: image partition using the Laplacian of planar graph.  
(See how Random Walk matrix also benefit to image partition in [my previous project of diffusion maps](https://github.com/yujieho/Image_Partition)!)



### Image Partition

##### :round_pushpin: Framework

The construction is refer to [Professor Spielman's Matlab code](http://www.cs.yale.edu/homes/spielman/sgta/), where also provides a fascinating talk of Spectral Graph Theory.  


1. Construct a planar graph on the image.
2. Compute the Laplacian.
3. Compute  <img src="readmeimg/Picture0.png" height="30" />  and its corresponding eigenvector.  
4. Divide the image into 2 using the eigenvector.  
    (An eigenvector assigns each vertex/pixel a number, simply puts positive ones to a group and non-positive ones to another.)  

<p align='center'><img src="readmeimg/Picture6.png" hight="250" /></p>


See implementation in `image_partition_L.ipynb`.  



##### :round_pushpin: Demonstration

For the results, the eigenvector cut the down-sampled version of image into 2 parts: the part with read filter and the remain part.


:pencil2: `images/cat.jpg`, left: original image, right: result image with size 90 * 140.  
<p align='center'>
    <img src="images/cat.jpg" width="300" />
    <img src="image_partition_results/cat_eigv2cut.jpg" width="300" />
</p>

:pencil2: `images/daisy.jpg`, left: original image, right: result image with size 200 * 200.  
<p align='center'>
    <img src="images/daisy.jpg" width="280" />
    <img src="image_partition_results/daisy_eigv4cut.jpg" width="280" />
</p>

:pencil2: `images/fruit4.jpg`, left: original image, right: result image with size 80 * 80.  
<p align='center'>
    <img src="images/fruit4.jpg" width="280" />
    <img src="image_partition_results/fruit4_eigv5cut.jpg" width="280" />
</p>

See more results in the `image_partition_results` file.


##### :round_pushpin: Conclusion

Various ways to improve the performance:

1. Find a better weight for each edge.
2. Find a better selection of the eigenvector indices.




## Large <img src="readmeimg/Picture0.png" height="50" />

### Introduction

For a good d-regular expander:

1. Every vertex subset has many neighbors, by the definition of the conductance. 

2. It has few edges compare to the number of its vertices.  

3. It is a sparsification of the complete graph. That is, they have similar spectrums of eigenvalues and eigenvectors, but the expander has much less edges.  

4. It acts like a random graph when it has many vertices.  


Some expanders: 
<img>



A goal here is to construct an infinite families of *d*-regular expanders with constant *d* and constant lower bound of <img src="readmeimg/Picture0.png" height="30" /> .  

There are 2 strategies that I implement using Matlab. Describe in the following sections.  


##### :mag: Difficulty
Note that computing  <img src="readmeimg/Picture0.png" height="30" />  become expensive when *n* is large, I use power method with Rayleigh quotient and matrix deflation technique to deal with this problem.  



### The Marguli-Gabber-Galil Expander

This is a simple explicit construction of expanders.  


##### :round_pushpin: Framework

For a given *n*, construct a graph with *n x n* vertices.  

Consider a vertex as a pair from {0,...,*n* − 1} × {0,...,*n* − 1}, where the group operation is coordinate-wise addition modulo *n*.  

Connected vertex (a,b) to (a+1,b), (a-1,b), (a,b+1), (a,b-1), (a+b,b), (a-b,b), (a,b+a), (a,b-a).  

The graph is a 8-regular graph with multi-edges and self-loops.

One can prove that there exist a constant *c > 0* such that <img src="readmeimg/Picture0.png" height="30" />  for all *n*. [2]


##### :round_pushpin: Demonstration

<img>


#### The Zig-Zag Product







## References
[1] [Course: Spectral Graph Theory, Daniel A. Spielman, Yale.](http://www.cs.yale.edu/homes/spielman/561/syllabus.html)  
[2] [Course: Graph Partitioning, Expanders and Spectral Methods, Luca Trevisan, UC Berkeley.](https://people.eecs.berkeley.edu/~luca/expanders2016/)  
[3] Spectral partitioning works: Planar graphs and finite element meshes, Daniel A. Spielman and Shang-Hua Teng, Linear Algebra and its Applications, 421:284–305, 2007.

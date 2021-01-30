<h1 align="center">The Second Laplacian Eigenvalue</h1>
<div align="center"><i>A survey on the second smallest Laplacian eigenvalue <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> and its applications.</i></div>
<br>

This project reveals the relationship between <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> and the connectivity of a graph.



## Contents
- [Introduction](#Introduction)

    - [Normalized Laplacian](#Normalized-Laplacian)
    - [The Laplacian Eigenvalue](#The-Laplacian-Eigenvalue)
    - [Conductance](#Conductance)
    - [Cheeger's Inequality](#Cheeger's-Inequality)

- [Small <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />](#Small)

    - [Introduction](#Introduction)
    - [Image Partition](#Image-Partition)

- [Large <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />](#Large)

    - [Introduction](#Introduction)
    - [The Marguli-Gabber-Galil Expander](#The-Marguli-Gabber-Galil-Expander)
    - [The Zig-Zag Product](#The-Zig-Zag-Product)

- [References](#References)



## Introduction


### Normalized Laplacian

1. <img src="https://latex.codecogs.com/gif.latex?I-D^{-1/2}AD^{-1/2}" title="I-D^{-1/2}AD^{-1/2}" />, where *A* is the adjacency matrix and *D* is a diagonal matrix with degree of vertices on its diagonal.  

2. Symmetric, singular, positive semidefinite. 

3. Measure the smoothness of a vector *x*.  



### The Laplacian Eigenvalue

1. Eigenvalues <img src="https://latex.codecogs.com/gif.latex?\lambda_i" title="\lambda_i" /> *i* = 1, 2, ..., n are between 0 and 2.  

2. The smallest eigenvalue of Laplacian is always equal to 0, and its eigenvector is the all-one vector.

3. The number of  <img src="https://latex.codecogs.com/gif.latex?\lambda_i" title="\lambda_i" />= 0 is equal to the number of connected component a graph has.  

4. <img src="readmeimg/Picture1.png" height="10" />

5. <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />= 0 iff the graph is disconnected.
<p align='center'><img src="readmeimg/Picture2.png" height="50" /></p>  

6. The largest eigenvalue is equal to 2 if a graph is bipartite.  




### Conductance

1. For a graph *G = (V,E)*, conductance of a vertex subset *S* is (number of boundary of *S*) / min( number of vertex in *S*, number of vertex in *V-S* ).  
<p align='center'>
    <img src="readmeimg/Picture4.png" height="50" />
    <img src="readmeimg/Picture3.png" height="10" />
</p>

2. Conductance of a graph is the smallest conductance of a vertex subset *S* with size < |*V*|/2 .  



### Cheeger's Inequality

1. <p align='center'><img src="readmeimg/Picture5.png" height="10" /></p>  

2. Right side indicates:  
    - Small <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> implies small conductance.
    - Small conductance implies its corresponding eigenvector is a good cut.
<img>  

3. Left side indicates:  
    - Large <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> implies large conductance. 
    - The graph is well-connected and is an expander.





## Small <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />

### Introduction

:mag: Intuitively, graphs that can be easily divided into two have small <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />:
<img>  


:mag: Surprisingly, planar graphs also have small <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> [3](#3) :
<img>


This lead me to the next topic: image partition using the Laplacian of planar graph.



### Image Partition

Interesting to found Laplacian also contribute in image partition, after finished the project of [image partition using the Random Walk matrix](https://github.com/yujieho/Image_Partition).


#### Framework

The construction is refer to [Professor Spielman's Matlab code](http://www.cs.yale.edu/homes/spielman/sgta/), where also provides a fasinating talk of Spectral Graph Thoery.  


1. Construct a planar graph on the image.
2. Compute the Laplacian.
3. Compute <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> and its corresponding eigenvector.  
4. Divide the image into 2 using the eigenvector.  
    (An eigenvector assigns each vertex/pixel a number, simply puts positive ones to a group and non-positive ones to another.)  

<p align='center'><img src="results/intro.png" hight="250" /></p>


See implementation in `image_partition_L.ipynb`.  



#### Demonstration

For the results, the eigenvector cut the down-sampled version of image into 2 parts, the part with read filter and the remain part.


:pencil2: `images/cat.jpg`, left: original image, right: result image with size 90 * 140.  
<p align='center'>
    <img src="images/cat.jpg" width="350" />
    <img src="results/cat_eigv2cut.jpg" width="350" />
</p>

:pencil2: `images/daisy.jpg`, left: original image, right: result image with size 200 * 200.  
    <img src="images/daisy.jpg" width="350" />
    <img src="results/daisy_eigv4cut.jpg" width="350" />
</p>

:pencil2: `images/fruit4.jpg`, left: original image, right: result image with size 80 * 80.  
<p align='center'>
    <img src="images/fruit4.jpg" width="350" />
    <img src="results/fruit4_eigv5cut.jpg" width="350" />
</p>

See more results in the `image_partition_results` file.


#### Conclusion

Various ways to improve the performance:

1. Find a better weight for each edge.
2. Find a better selection of the eigenvector indices.




## Large <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />

### Introduction

For a good d-regular expander:

1. Every vertex subset has many neighbors, by the definition of the conductance. 

2. It has few edges compare to the number of its vertices.  

3. It is a sparsification of the complete graph. That is, they have similar spectrums of eigenvalues and eigenvectors, but the expander has much less edges.  

4. It acts like a random graph when it has many vertices.  


Some expanders: 
<img>



:mag: A goal here is to construct a infinite families of *d*-regular expanders with constant *d* and constant lower bound of <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" />.  

There are 2 strategies that I implement using Matlab. Discribe inthe following sections.  


:mag: Note that computing <img src="https://latex.codecogs.com/gif.latex?\lambda_2" title="\lambda_2" /> become expensive when *n* is large, I use power method with Rayleigh quotient and matrix deflation technique to deal with this problem.  



### The Marguli-Gabber-Galil Expander

This is a simple explicit construction of expanders.  


#### Framework

For a given *n*, construct a graph with *n x n* vertices.  
Consider a vertex as a pair from {0,...,*n* − 1} × {0,...,*n* − 1}, where the group operation is coordinate-wise addition modulo *n*.  
Connected vertex (a,b) to (a+1,b), (a-1,b), (a,b+1), (a,b-1), (a+b,b), (a-b,b), (a,b+a), (a,b-a).  
The graph is a 8-regular graph with multi-edges and self-loops.

One can prove that there exist a constant *c > 0* such that <img src="https://latex.codecogs.com/gif.latex?\lambda_2(G_n)\leq c" title="\lambda_2(G_n)\leq c" /> for all *n*. [2](#2)


#### Demonstration

<img>


#### The Zig-Zag Product







## References
[1] [Course: Spectral Graph Theory, Daniel A. Spielman, Yale.](http://www.cs.yale.edu/homes/spielman/561/syllabus.html)  
[2] [Course: Graph Partitioning, Expanders and Spectral Methods, Luca Trevisan, UC Berkeley.](https://people.eecs.berkeley.edu/~luca/expanders2016/)  
[3] Spectral partitioning works: Planar graphs and finite element meshes, Daniel A. Spielman and Shang-Hua Teng, Linear Algebra and its Applications, 421:284–305, 2007.

<h1 align="center">The Second Laplacian Eigenvalue</h1>
<div align="center"><i>A survey on the second smallest Laplacian eigenvalue  <img src="images_readme/picture0.png" height="20" />  and its applications.</i></div>
<br>

This project reveals the relationship between  <img src="images_readme/picture0.png" height="20" /> and the connectivity of a graph.



## Contents
- [Introduction](#Introduction)
    - [Normalized Laplacian](#Normalized-Laplacian)
    - [Eigenvalue of Normalized Laplacian](#Eigenvalue-of-Normalized-Laplacian)
    - [Conductance of Graph](#Conductance-of-Graph)
    - [Cheeger's Inequality](#Cheeger's-Inequality)

- [Small Second Eigenvalue](#Small-Second-Eigenvalue) 
    - [Image Partition](#Image-Partition)

- [Large Second Eigenvalue](#Large-Second-Eigenvalue) 
    - [Expander](#Expander)
    - [Algebraic Construction](#Algebraic-Construction)  
    - [Combinatorial Construction](#Combinatorial-Construction)  

- [References](#References)





## Introduction


### Normalized Laplacian

<p align='center'><img src="images_readme/picture7.png" height="25" /></p>  

where *A* is the adjacency matrix and *D* is a diagonal matrix with degree of vertices on its diagonal.  

 - Symmetric, singular, positive semidefinite.  
 - Measure the smoothness of a vector *x*.  



<br>

### Eigenvalue of Normalized Laplacian

 - Eigenvalues are between 0 and 2.  

 - The smallest eigenvalue of Laplacian is always equal to 0, and its eigenvector is the all-one vector.  
 
 - The multiplicity of the 0 eigenvalue is equal to the number of connected component a graph has.   
 
 - The largest eigenvalue is 2 iff a graph is bipartite.  





<br>

### Conductance of Graph

 - For a graph *G* = (*V*,*E*), conductance of a vertex subset *S* is (number of boundary of *S*) / min( number of vertex in *S*, number of vertex in *V-S* ).  
<p align='center'><img src="images_readme/picture3-2.png" height="150" /></p>

 - Conductance of a graph is the smallest conductance of vertex subset *S* with size < |*V*| / 2 .  




<br>

### Cheeger's Inequality

<p align='center'><img src="images_readme/picture5.png" height="40" /></p>  

Right side indicates:  
 - Small  <img src="images_readme/picture0.png" height="20" />  implies small conductance.  
 - Small conductance implies that its corresponding eigenvector provide a good cut.  


Left side indicates:  
 - Large  <img src="images_readme/picture0.png" height="20" />  implies large conductance.  
 - Large conductance implies that the graph is well-connected and is an expander.  





<br>

## Small Second Eigenvalue

### Introduction

Intuitively, graphs that can be easily divided into two have small  <img src="images_readme/picture0.png" height="20" />   :

(See images in the `images_readme` file.)
<p align='center'>
    <img src="images_readme/graph1.png" width="190" />
    <img src="images_readme/graph1-eigval.png" width="190" />
    <img src="images_readme/graph2.png" width="190" />
    <img src="images_readme/graph2-eigval.png" width="190" />
</p>  


Surprisingly, planar graphs also have small  <img src="images_readme/picture0.png" height="20" />  [3] :
<p align='center'>
    <img src="images_readme/graph6.png" width="190" />
    <img src="images_readme/graph6-eigval.png" width="190" />
    <img src="images_readme/graph5.png" width="190" />
    <img src="images_readme/graph5-eigval.png" width="190" />
</p>  

This fascinating property of planar graphs lead me to the next topic: image partition using the Laplacian of planar graph.  
(See how Random Walk matrix is also used in image partition in [my previous project of diffusion maps](https://github.com/yujieho/Image_Partition)!)




<br>
<br>
<br>

### Image Partition

Implement in `IP-L.ipynb`.  

<br>

***:round_pushpin: Framework***

The construction is refer to [Professor Spielman's MATLAB code](http://www.cs.yale.edu/homes/spielman/sgta/), where also provides a fascinating talk of Spectral Graph Theory.  

1. Construct a planar graph on the image.  
2. Compute the Laplacian.  
3. Compute  <img src="images_readme/picture0.png" height="20" />  and its corresponding eigenvector.  
4. Divide the image into 2 using the eigenvector.  
    (An eigenvector assigns each vertex/pixel a number, simply puts positive ones to a group and non-positive ones to another.)  

<p align='center'><img src="images_readme/picture6.png" width="900" /></p>




<br>

***:round_pushpin: Demonstration***

For the results, the eigenvector cut the down-sampled version of image into 2 parts: the part with read filter and the remain part.


`images_LP-L/cat.jpg`. Left: original image. Right: result image, size: 90 * 140.  
<p align='center'>
    <img src="images_IP-L/cat.jpg" width="300" />
    <img src="results_IP-L/cat-eigv2cut.jpg" width="300" />
</p>

`images_IP-L/fruit3.jpg`. Left: original image. Right: result image, size: 130 * 100.  
<p align='center'>
    <img src="images_IP-L/fruit3.jpg" width="300" />
    <img src="results_IP-L/fruit3-eigv2cut.jpg" width="300" />
</p>

`images_IP-L/fruit4.jpg`. Left: original image. Right: result image, size: 80 * 80.  
<p align='center'>
    <img src="images_IP-L/fruit4.jpg" width="280" />
    <img src="results_IP-L/fruit4-eigv5cut.jpg" width="280" />
</p>

See more results in `results_IP-L`.



<br>

***:round_pushpin: Conclusion***

Various ways to have a clearer contour:

1. Define a better weight for each edge.  
2. Find a better selection of the eigenvector indices.






<br>

## Large Second Eigenvalue


### Expander

A graph with large second eigenvalue is an expander.   

A 'good' expander is a graph with few edges but still well-connected.  

Good expanders have various theories in mathematics and applications in computer science. 

I will introduce some properties and explicit constructions of a good d-regular expander.  



<br>

***:round_pushpin: Properties***

- Every vertex subset has many neighbors, by the definition of the conductance.  

- It is a sparsification of the complete graph. That is, they have similar spectrums of eigenvalues and eigenvectors, but the expander has much less edges.  

- It acts like a random d-regular graph when it has many vertices, by the mixing lemma.  

- A random walk on it converges quickly to the stationary distribution, by the random walk lemma.  



<br>

***:round_pushpin: Some expanders***

<p align='center'>
    <img src="images_readme/graph7.png" width="280" />
    <img src="images_readme/graph10.png" width="280" />
</p>  

<p align='center'>
    <img src="images_readme/graph7-eigval.png" width="280" />
    <img src="images_readme/graph10-eigval.png" width="280" />

</p>  



<br>

***:round_pushpin: Construct expander family***

Expander family is an infinite family Gn of d-regular graphs with second Laplacian eigenvalue bounded from below by a positive constant c, where d and c are independent of n.  

Constructing such family is useful in computer science.

In `expander`, I implements 2 strategies using MATLAB, one is algebraic and the other is combinatorial.  

Descriptions are in the following sections.




<br>

***:round_pushpin: Difficulty***

Since `eigs` become very slow when *n* is large, I use power method with Rayleigh quotient and matrix deflation technique to find  <img src="images_readme/picture0.png" height="20" /> after the construction.  

The algorithm can be seen in `expander/myeig.m`.




<br>
<br>
<br>

### Algebraic construction

Constructing the Margulis–Gabber–Galil expander. 

- Simple to construct.  
- Hard to analyze the expansion via second eigenvalue.  



<br>

***:round_pushpin: Properties***


For a given *n*:

- The graph has *n* x *n* vertices.  
- The graph is 8-regular.  
- The graph has multi-edges and self-loops.  
- There exist a constant *c > 0* such that <img src="images_readme/picture0.png" height="20" /> is larger than *c*  for all *n*. [2, lecture 18] 



<br>

***:round_pushpin: Framework***

A vertex is a pair from {0, 1, ..., n-1} x {0, 1, ..., n-1}.

The group operation is coordinate-wise addition modulo n.

Connected vertex (a,b) to:

- (a+-1,b)  
- (a,b+-1)  
- (a+-b,b)  
- (a,b+-a)  


The algorithm can be seen in `expander/Margulis.m`.



<br>

***:round_pushpin: Demonstration***

	n = 12, eigval2 = 0.11339  
	n = 24, eigval2 = 0.067516  
	n = 36, eigval2 = 0.054649  
	n = 60, eigval2 = 0.044917  
	n = 100, eigval2 = 0.041554  
    n = 120, eigval2 = 0.040094  


<p align='center'>
    <img src="results_M_expander/n12.png" width="280" />
    <img src="results_M_expander/n24.png" width="280" />
</p>

<p align='center'>
    <img src="results_M_expander/n12-eigval.png" width="280" />
    <img src="results_M_expander/n24-eigval.png" width="280" />
</p>

See results in `results_M_expander`.






<br>
<br>
<br>

### Combinatorial construction

Constructing expanders using zig-zag product and tensor product.  
The algorithms are refer to the descriptions in [4].

- Based on iterations.  
- Simple to analyze the expansion via second eigenvalue.  




<br>

#### **:round_pushpin: The zig-zag product**

Implement in `expander/zigzagproduct.m`.

<br>

***Framework***

For a *d*-regular graph H with *h* vertices, and a *h*-regular graph G with *n* vertices, construct the graph <img src="images_readme/picture8.png" height="20" /> by:

1. Replace each vertex of G with H, i.e., forming *n* clouds, each cloud has *h* vertices.  
2. Edges form between 2 vertices if they can reach each other by taking 3 steps:  

    a. A step in one cloud. (zig)  
    b. A step to another cloud.  
    c. A step in the new cloud. (zag)

One need to number the vertices in H and think of them as the edge indices of a vertex in G.

A step in a cloud is taken at an edge in H.  
For instance, consider 2 vertices, say 1 and 2. If (1,2) is an edge in H, then a step can form between the 1st and 2nd vertices in a cloud.

A step between clouds is taken at where the edge indices and the vertices indices coincides.  
For instance, consider 2 clouds, say u and v. If v is the 5th neighbor of u, and u is the 2nd neighbor of v, then a step can form between the 5th vertex in u and the 2nd vertex in v.  


<br>

***Properties***

The graph  <img src="images_readme/picture8.png" height="20" />:

- It is *d*^2-regular.
- It has *h* x *n* vertices.
- eigenvalue



<br>

***Example***

<p align='center'>
    <img src="results_zigzag/demo-zigzag-g0.png" width="275" />
    <img src="results_zigzag/demo-zigzag-g1.png" width="275" />
    <img src="results_zigzag/demo-zigzag-g2.png" width="275" />
</p>



<br>

#### **:round_pushpin: The recursion**

Since the basic graph is large, the following graphs quickly exceeds maximum array size preference of MATLAB.  

Thus, I did not write a code for the recursion, but I will state the properties and framework of it.

<br>

***Framework***

1. Construct a basic graph G_0, it is *d*-regular and has *d*^8 vertices.  
2. Define G_1 to be the square of G_0.  
3. Define G_2 to be the tensor product of G_0 with itself.  
4. For t > 2, define G_t by  
<p align='center'><img src="images_readme/picture10.png" height="25" /></p>  


<br>

***Properties***

The graph G_t:

- It is *d*^2-regular.
- It has *d*^{8t} vertices.
- eigenvalue




<br>

#### **:round_pushpin: The basic graph**

Implement in `expander/affineplane.m`.  

It should be a very good expander. Here I used the affine plane.  

To make an affine plane the basic graph for recursion, one need to choose a sufficiently large *q* and zig-zag product it for 7 times.

<br>

***:round_pushpin: Properties of affine plane***

For a given prime power *q*, the affine plane:

- It is *q*-regular.  
- It has *q* x *q* vertices.  
- It has self-loops.  
- The second smallest eigenvalue is 1/*q*^{1/2}.



<br>

***:round_pushpin: Framework of constructing affine plane***

A vertex is a pair from the field  <img src="images_readme/picture9.png" height="25" />.

Connected vertex (a, b) to all the points on the line y = ax - b.  



<br>

***Example***

<p align='center'>
    <img src="results_zigzag/demo-affineplane-q5.png" width="280" />
    <img src="results_zigzag/demo-affineplane-q9.png" width="280" />
</p>



<br>

#### **:round_pushpin: Second eigenvalue**

For the construction to have good results (say, second eigenvalue > 4/5), the basic graph and thus the expander family have rather large degree.  

Since the basic graph is large in size, I will not display graphs G(t). However, I will show the second eigenvalues of them.  




<br>

## References
[1] [Course: Spectral Graph Theory, Daniel A. Spielman, Yale.](http://www.cs.yale.edu/homes/spielman/561/syllabus.html)  
[2] [Course: Graph Partitioning, Expanders and Spectral Methods, Luca Trevisan, UC Berkeley.](https://people.eecs.berkeley.edu/~luca/expanders2016/)  
[3] Spectral partitioning works: Planar graphs and finite element meshes. Daniel A. Spielman and Shang-Hua Teng. Linear Algebra and its Applications, 421:284–305, 2007.  
[4] Entropy Waves, the Zig-Zag Graph Product, and New Constant-Degree Expanders and Extractors. O. Reingold, S. Vadhan, and A. Wigderson. Annals of Math- ematics, Vol. 155 (1), pages 157–187, 2001. Preliminary version in 41st FOCS, pages 3–13, 2000.
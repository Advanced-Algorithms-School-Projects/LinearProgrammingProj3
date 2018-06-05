param numColors;
param numNodes;

set edgeList dimen 2;

param edge{i in 0..numNodes-1, j in 0..numNodes-1} :=
	(if (i,j) in edgeList or (j,i) in edgeList then 1 else 0);

var color{i in 0..numNodes-1, j in 0..numColors-1} binary;
var conflicts{i in 0..numNodes-1, j in 0..numNodes-1} binary;

minimize objective: sum{i in 0..numNodes-1, j in 0..numNodes-1} conflicts[i,j];

subject to
	c1 {i in 0..numNodes-1}: sum{j in 0..numColors-1} color[i,j] = 1;

	# constraint {i in 0..numNodes-1, j in 0..numNodes-1, c in 0..numColors-1}:
	#		edge[i,j]*color[i,c]*color[j,c] = conflicts[i,j];

# DNAandGrids
This project was created to host data sets and programs used in the paper [1] and the accompanying supplementary information.
<br>
The programs are written in <a href="http://www.sagemath.org/">SAGE</a>. <br>

For each GN we sampled 16000 grids; note that for computational reasons, for higher GN we performed 16 iterations of the process, each time sampling 1000 configuration; for smaller GN we iterated the process twice, sampling 8000 configurations each time.<br>

For each grid number, and for each iteration, we created GN-2 adjacency tables. The first matrix accounts for unbiased strand passages. The following ones account for passages happening at hooked juxtapositions. Each of these GN-3 tables accounts for passages happening at juxtapositions where the length of the maximum segment of the rectangle is <= k, where 0< k < GN - 4.<br>



For contact information, please see <a href="https://www.maths.ox.ac.uk/people/agnese.barbensi">here</a>.
<br><br><br>


[1]: "Grid diagram approach to investigate knot spaces and topoisomerase-mediated simplification of DNA topology", A.Barbensi, D.Celoria, D.Buck, A.Stasiak,H.Harrington. Submitted to PNAS (2019).

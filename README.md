# DNAandGrids
This project was created to host data sets and programs used in the paper [1] and the accompanying supplementary information.
<br>
The programs are written in <a href="http://www.sagemath.org/">SAGE</a>. <br>

For each grid number $GN$ we created $GN-3$ (hooked) adjacency tables. Each of these tables accounts for passages happening at juxtapositions where the length of the maximum segment of the rectangle is $\leq l$, where $1 \leq l \leq GN - 3$. The probability that a configuration representing a specific knot type is transformed into an unknotted one by an interleaving commutation increases as we consider hooked juxtapositions with shorter edges.<br>

Note that for computational reasons, for higher $GN$ we performed $16$ iterations of the process, each time sampling $1000$ configuration; for smaller $GN$ we iterated the process twice, sampling $8000$ configurations each time.<br>


For contact information, please see <a href="https://www.maths.ox.ac.uk/people/agnese.barbensi">here</a>.
<br><br><br>


[1]: "Grid diagram approach to investigate knot spaces and topoisomerase-mediated simplification of DNA topology", A.Barbensi, D.Celoria, D.Buck, A.Stasiak,H.Harrington. Submitted to PNAS (2019).

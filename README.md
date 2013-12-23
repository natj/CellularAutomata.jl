CellularAutomata
===================

One & two dimensional Cellular Automata models.

Make the initial CA model (rule 90) and generate 100 generations
```julia
using CellularAutomata

ca90 = CA([0,1,0,1,1,0,1,0],10)
generate(ca90, 100)
```



Cellular Automata
===================

One & two dimensional cellular automata models.


Elementary CA
-------------
To generate an elementary cellular automaton, use
```julia
ca = CellularAutomaton(rule, init, gen)
```
where `rule` is the Wolfram code (integer), `init` is a vector containing the initial starting condition and `gen` is the number of generations to be computed.
For a single starting cell in the middle just omit the `init` vector.

To generate 15 generations of elementary cellular automaton of rule 90 use
```julia
using CellularAutomata

ca90 = CellularAutomaton(90, 15)
```
                                #                                    
                               # #                                   
                              #   #                                  
                             # # # #                                 
                            #       #                                
                           # #     # #                               
                          #   #   #   #                              
                         # # # # # # # #                             
                        #               #                            
                       # #             # #                           
                      #   #           #   #                          
                     # # # #         # # # #                         
                    #       #       #       #                        
                   # #     # #     # #     # #                       
                  #   #   #   #   #   #   #   #                      
                 # # # # # # # # # # # # # # # #                     


Totalistic CA
-------------

For a more complex cellular automaton you can change the number of states `k` the cell can be and the radius `r` of neighbors that can influence the computations.
If `k` is changed to be larger than 2, a totalistic CA is computed where only the average value of all neighbors count.
This can be done like this
```julia
ca = CellularAutomaton(993, 15, k=3)
```
	                        X                         
	                       XXX                        
	                      X# #X                       
	                     X     X                      
	                    XXX   XXX                     
	                   X# #X X# #X                    
	                  X     #     X                   
	                 XXX   ###   XXX                  
	                X# #X # X # X# #X                 
	               X      # X #      X                
	              XXX    ## X ##    XXX               
	             X# #X  #   X   #  X# #X              
	            X     X### XXX ###X     X             
	           XXX   X XX  # #  XX X   XXX            
	          X# #X XX###X## ##X###XX X# #X           


2 dimensional CAs
-----------------

Two dimensional cellular automaton (like Conway's Game of Life) can be created by
```julia
ca = CA2d(B, S, init, gen)
```
where B and S are vectors that have the numbers of neighboring cells that define when cell is born or survives, init (matrix) is the initial starting condition and gen is the number of generations the CA is being computed.

Game of life is then run for 5 generations by typing
```julia
ca = CA2d([3], [2, 3], init, 5)
```
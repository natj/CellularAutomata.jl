Cellular Automata
===================

> A cellular automaton is a collection of "colored" cells on a grid of specified shape that evolves through a number of discrete time steps according to a set of rules based on the states of neighboring cells. 
> The rules are then applied iteratively for as many time steps as desired.

[mathworld.wolfram.com/CellularAutomaton](http://mathworld.wolfram.com/CellularAutomaton.html)


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

ca90 = CellularAutomaton(90, 16)
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

For a more complex cellular automaton you can change the number of states `k` the cell can be and the radius `r` of neighbors that can influence the states.
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
where `B` and `S` are vectors that have the numbers of neighboring cells that define when cell is born or survives, `init` (matrix) is the initial starting condition and `gen` is the number of generations the CA is to be computed.

Game of life is then run for 9 generations for e.g. a turbine pattern by typing
```julia
ca = CA2d([3], [2, 3], init, 9)
```

1st step

	   ###### ##        
	   ###### ##        
	          ##        
	   ##     ##        
	   ##     ##        
	   ##     ##        
	   ##               
	   ## ######        
	   ## ######        
	                    

2nd	       
             
	    ####            
	   #    # ##        
	   #    #   #       
	      ##    #       
	   ##    #  #       
	  #  #   #  #       
	  #  #    ##        
	  #    ##           
	  #   #    #        
	   ## #    #        
	       ####         
	               
     
3rd	     
               
	     ##             
	    ####            
	   # ## ## #        
	        ##  #       
	   ##  ##  ###      
	   #### #  ###      
	  #  #   #  #       
	 ###  # ####        
	 ###  ##  ##        
	  #  ##             
	   # ## ## #        
	       ####         
	        ##          
	             
       
4th

	    #  #            
	        #           
	         ##         
	   # ##      #      
	   #  #   #         
	  #   # ###         
	 #           #      
	    ### #   #       
	    #   #  #        
	 #      ## #        
	    ##              
	      #             
	       #  #         

	                    
5th

	        ##          
	         #          
	    ###  ##         
	  ### #   #         
	  #    # ##         
	      # #           
	    ## #    #       
	    #   # ###       
	    ##  ###         
	     #              
	     ##             


6th

	        ##          
	     #              
	    # #  ##         
	  # # ###  #        
	  #  ######         
	     ## ##          
	    ######  #       
	   #  ### # #       
	    ##  # #         
	         #          
	     ##             

	                    
7th	 
                   
	     #  # #         
	   ## # ###         
	    #      #        
	   ##     #         
	                    
	    #     ##        
	   #      #         
	    ### # ##        
	    # #  #          
	     
               
8th	                    

	    ## ## #         
	   ##  ## ##        
	           #        
	   ##               
	   ##     ##        
	          ##        
	   #                
	   ## ##  ##        
	    # ## ##         

	                    
9th	                    

	   ###### ##        
	   ###### ##        
	          ##        
	   ##     ##        
	   ##     ##        
	   ##     ##        
	   ##               
	   ## ######        
	   ## ######        
	            	                    
	                    
	                    
Running Tests
-----------------

To run tests, execute the following command from the root folder of the repository:

```julia
julia tests/run_tests.jl
```


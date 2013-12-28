Cellular Automata
===================

One & two dimensional Cellular Automata models.


Elementary CA
-------------

Generate 15 generations of elementary cellular automaton of rule 90
```jlcon
julia> using CellularAutomata

julia> ca90 = CellularAutomaton(90, 15)
```
```julia
30x15 Cellular Automaton	
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
```

Totalistic CA
-------------

If the number of states (k) is changed to be larger than 2, totalistic CA is computed
```jlcon
julia> ca=CellularAutomaton(993, 15, k=3)
```
```julia
30x15 Cellular Automaton
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
```


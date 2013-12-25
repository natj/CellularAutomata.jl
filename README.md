Cellular Automata
===================

One & two dimensional Cellular Automata models.


Elementary CA
-------------

Generate 15 generations of elementary cellular automaton of rule 90
```julia
using CellularAutomata

ca90 = CellularAutomaton(90, 15)
```

to obtain
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



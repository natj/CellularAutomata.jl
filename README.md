Cellular Automata
===================

One & two dimensional Cellular Automata models.


Elementary CA
-------------

Make the initial CA model (rule 90) that is 70 blocks in width and generate 16 step
```julia
using CellularAutomata

ca90 = CA(rule(90), 70)
generate(ca90, 16)
```

to obtain
```julia
72x17 Cellular Automata	
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



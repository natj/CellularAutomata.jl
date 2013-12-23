Cellular Automata
===================

One & two dimensional Cellular Automata models.

Make the initial CA model (rule 90) that is 70 blocks in width and generate 32 generations
```julia
using CellularAutomata

ca90 = CA(rule(90), 70)
generate(ca90, 32)
```

to obtain
```julia
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
	                   #                               #                    
	                  # #                             # #                   
	                 #   #                           #   #                  
	                # # # #                         # # # #                 
	               #       #                       #       #                
	              # #     # #                     # #     # #               
	             #   #   #   #                   #   #   #   #              
	            # # # # # # # #                 # # # # # # # #             
	           #               #               #               #            
	          # #             # #             # #             # #           
	         #   #           #   #           #   #           #   #          
	        # # # #         # # # #         # # # #         # # # #         
	       #       #       #       #       #       #       #       #        
	      # #     # #     # #     # #     # #     # #     # #     # #       
	     #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #      
	    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #     

```



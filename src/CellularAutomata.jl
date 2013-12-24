module CellularAutomata

import Base.show

include("1dim.jl")

export CA,
       rule,
       generate,
       show

#Print CA to screen
function show(io::IO, ca::CA) 
    io2 = IOBuffer()

    arr = ca.cells
    w, h = size(arr)

    print(io2, "$(w)x$(h) Cellular Automata")
    
    #TODO: print rule

    if ca.step > 2
        for i = 1:h
            print(io2,"\t")
            for j = 1:w
                if arr[j,i] == 0
                    print(io2," ")
                elseif arr[j,i] == 1
                    print(io2,"#")
                end
            end
            print(io2,"\n")
        end
    end    
    print(io, bytestring(io2))
end


#end of module
end

using CellularAutomata

tic()
ca = CA(rule(90), 1000)
generate(ca, 1000)
toc()
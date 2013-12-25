module CellularAutomata

import Base.show

include("1dim.jl")

export CellularAutomaton,
       rule,
       generate,
       show

#Print CA to screen
function show(io::IO, ca::CellularAutomaton) 
    io2 = IOBuffer()

    arr = ca.cells
    h, w = size(arr)

    print(io2, "$(w)x$(h) Cellular Automaton")
    print(io2, "\n")

    #TODO: print rule

    for i = 1:h
        print(io2,"\t")
        for j = 1:w
            if arr[i,j] == 0
                print(io2," ")
            elseif arr[i,j] == 1
                print(io2,"#")
            end
        end
        print(io2,"\n")
    end

    print(io, bytestring(io2))
end


#end of module
end

using CellularAutomata


#init=int(zeros(1000))
#init[int(1000/2)]=1

tic()
ca = CellularAutomaton(90, 1000)
toc()
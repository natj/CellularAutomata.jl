module CellularAutomata

import Base.show

include("1dim.jl")
include("2dim.jl")

export CellularAutomaton,
       CA2d,
       rule,
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
            elseif ca.k == 2 && arr[i,j] == 1
                print(io2,"#")
            elseif ca.k == 3 && arr[i,j] == 1
                print(io2,"X")
            elseif arr[i,j] == 2
                print(io2, "#")
            end
        end
        print(io2,"\n")
    end

    print(io, String(io2))
end

#Print CA to screen
function show(io::IO, ca::CA2d)
    io2 = IOBuffer()

    arr = ca.cells
    h, w, gen = size(arr)

    print(io2, "$(w)x$(h)x$(gen) Cellular Automaton")
    print(io2, "\n")

    #TODO: print rule

    for g in 1:gen
        for i = 1:h
            print(io2,"\t")
            for j = 1:w
                if arr[i,j, g] == 0
                    print(io2," ")
                elseif arr[i,j, g] == 1
                    print(io2, "#")
                end
            end
            print(io2,"\n")
        end
        print(io2,"\n\n")
    end

    print(io, String(io2))
end


#end of module
end

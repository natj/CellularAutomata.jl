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

    print(io, bytestring(io2))
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

    print(io, bytestring(io2))
end


#end of module
end

using CellularAutomata


function rule90example()
  #init=int(zeros(1000))
  #init[int(1000/2)]=1
  tic()
  ca = CellularAutomaton(90, 15)
  toc()
end


function turbine_example()
  init = int(zeros(20,20))
  init[4, 4:9] = 1
  init[5, 4:9] = 1

  init[4:9, 11] = 1
  init[4:9, 12] = 1

  init[11, 7:12] = 1
  init[12, 7:12] = 1

  init[7:12, 4] = 1
  init[7:12, 5] = 1

  #game of life
  ca = CA2d([3], [2,3], init, 5)
end


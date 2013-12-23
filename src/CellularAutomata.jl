module CellularAutomata

include("1dim.jl")

export CA,
       generate



#end of module
end

using CellularAutomata

ruls=[0,1,0,1,1,0,1,0]
ca = CA(ruls, 100)

tic()
generate(ca, 5000)
toc()
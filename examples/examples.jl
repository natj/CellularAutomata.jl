using CellularAutomata

#Rule 90 1-dim Cellular Automata run for 15 generations
function rule90example()
    #init=Array{Int}(zeros(1000))
    #init[Int(1000/2)]=1
    tic()
    ca = CellularAutomaton(90, 15)
    toc()

    ca
end

#Turbine pattern from Conway's game of life
function turbine_example()
    init = Array{Int}(zeros(20,20))
    init[4, 4:9] = 1
    init[5, 4:9] = 1

    init[4:9, 11] = 1
    init[4:9, 12] = 1

    init[11, 7:12] = 1
    init[12, 7:12] = 1

    init[7:12, 4] = 1
    init[7:12, 5] = 1

    #game of life
    CA2d([3], [2,3], init, 5)
end

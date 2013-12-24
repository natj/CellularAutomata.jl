#1-dim CAs

#Wolfram elementary CA
type CA

    #user given values
    ruleset::Array{Int,1}

    #internal variables
    cells::Array{Int,2}
    step::Int

    function CA(ruleset::Array{Int,1},
                w::Int)
        
        startup=int(zeros(w))
        startup[int(w/2)] = 1
        cells = int(zeros(w))
        cells = hcat(cells, startup)

        step = 2
        new(ruleset, cells, step)
    end
end

#Parse rule numbering according to Wolfram code
function rule(n::Int)
    digits(n, 2, 8)
end

#Evaluate the next generation
function next_step(ca::CA)
    old = ca.cells[:, ca.step]
    w = length(old)
    arr = Array(Int, w)

    #Cyclic boundary conditions 
    ind = parseint(string(old[end], old[1], old[2]), 2)
    arr[1] = ca.ruleset[ind+1]
    for i = 2:w-1
        str = string(old[i-1], old[i], old[i+1])
        ind = parseint(str, 2)
        arr[i] = ca.ruleset[ind+1]
    end
    ind = parseint(string(old[end-1], old[end], old[1]), 2)
    arr[end] = ca.ruleset[ind+1]

    ca.cells = hcat(ca.cells, arr)
    ca.step +=1
end

#Generate the CA
function generate(ca::CA, steps)
    while ca.step <= steps
        next_step(ca)
    end
#    ca
end


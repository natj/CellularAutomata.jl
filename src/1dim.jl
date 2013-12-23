#1-dim CAs

#Elementary CA
type CA

    #user given values
    ruleset::Array{Int,1}

    #internal variables
    cells::Array{Int,2}
    step::Int

    function CA(ruleset::Array{Int,1},
                w::Int)
        
        w=w+2
        startup=int(zeros(w))
        startup[int(w/2)] = 1
        cells = int(zeros(w))
        cells = hcat(cells, startup)

        step = 2
        new(ruleset, cells, step)
        
    end
end

#Parse rule numbering according to Wolfram
function rule(n::Int)
#    reverse(digits(n, 2, 8))
    digits(n, 2, 8)

end

#Evaluate the next generation
function next_step(ca::CA)
    old = ca.cells[:, ca.step]
    w = length(old)
    arr = zeros(w)
    for i = 2:w-1
        str = string(old[i-1], old[i], old[i+1])
        ind = parseint(str, 2)
        arr[i] = ca.ruleset[ind+1]
    end
    ca.cells = hcat(ca.cells, arr)
    ca.step +=1
end

#Generate the CA
function generate(ca::CA, steps)
    while ca.step <= steps
        next_step(ca)
    end
    ca
end


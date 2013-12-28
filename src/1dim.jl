#1-dim CAs

#Elementary CA with r-nearest neighbor and k states
type CellularAutomaton

    #user given values
    N::Int #code
    ruleset::Array{Int8,1} #set of rules
    k::Int #number of states
    r::Int # r-nearest neighbor

    #internal variables
    cells::Array{Int8,2}

    function CellularAutomaton(N::Int, init::Array{Int,1}, gen::Int; k::Int=2, r::Int=1)
        ruleset = rule(N, k, r)

        w = length(init)
        cells = Array(Int8, gen, w)
        cells[1,:] = int8(init[:])'

        mp = reverse(Int8[k^i for i = 0:k])

        for i = 2:gen
            for j = 1:w
                ind = 0 ; s = 1
                for q = (j-r):(j+r)

                    #Cyclic boundary conditions
                    if q < 1
                        q = w-q
                    end
                    if q > w
                        q = q-w
                    end

                    ind += mp[s]*cells[i-1, q] 
                    s += 1
                end
                cells[i,j] = ruleset[ind+1]
            end
        end

        new(N, ruleset, k, r, cells)
    end

    function CellularAutomaton(N::Int, gen::Int; kvs...)
        init = int(zeros(2*gen))
        init[gen] = 1
        
        CellularAutomaton(N, init, gen)
    end
end

#Parse rule numbering according to Wolfram code
rule(n::Int, k=2, r=1) = digits(n, k, k^(2r+1))




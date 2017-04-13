#1-dim CAs

#Elementary & totalistic CA with r-nearest neighbor and k states
type CellularAutomaton

    #user given values
    N::Int #code
    ruleset::Array{Int8,1} #set of rules
    k::Int #number of states
    r::Int #r-nearest neighbor

    #internal variables
    cells::Array{Int8,2}

    function CellularAutomaton(N::Int, init::Array{Int,1}, gen::Int; k::Int=2, r::Int=1)
        ruleset = rule(N, k, r)

        w = length(init)
        cells = Array(Int8, gen, w)
        cells[1,:] = Array{Int8}(init[:])'

        if k == 2
            #Elementary CA
            mp = reverse(Int8[k^i for i = 0:2r+1])
        else
            #Totalistic CA
            mp = Array{Int8}(ones(2r+1))
        end

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

    #Quick setup for one seed cell in the center
    function CellularAutomaton(N::Int, gen::Int; kvs...)
        init = Array{Int}(zeros(2*gen))
        init[gen] = 1

        CellularAutomaton(N, init, gen; kvs...)
    end
end

#Parse rule numbering according to the Wolfram code
function rule(n::Int, k=2, r=1)
    if k < 2
        error("number of states (k) must be larger than 1; you gave $k")
    elseif k == 2
        #Elementary CA
        return digits(n, k, k^(2r+1))
    else
        #Totalistic CA
        return digits(n, k, (2r+1)k-2)
    end
end

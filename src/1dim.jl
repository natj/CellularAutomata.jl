#1-dim CAs

#Elementary CA with r-nearest neighbor and k states
type CellularAutomaton

    #user given values
    ruleset::Array{Int8,1}

    #internal variables
    cells::Array{Int8,2}

    function CellularAutomaton(rulen::Int, init::Array{Int,1}, gen::Int; k=2, r=1)
        ruleset = rule(rulen, k, r)

        w = length(init)
        cells = Array(Int8, gen, w)
        cells[1,:] = init[:]'

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

        new(ruleset, cells)
    end

    function CellularAutomaton(rulen::Int, gen::Int; kvs...)
        init = int(zeros(2*gen))
        init[gen] = 1
        
        CellularAutomaton(rulen, init, gen)
    end
end

#Parse rule numbering according to Wolfram code
rule(n::Int, k=2, r=1) = digits(n, k, k^(2r+1))




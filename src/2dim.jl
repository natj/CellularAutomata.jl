#2-dim CAs

#Two dimensional Cellular Automaton
#TODO: Change naming to be consistent
type CA2d

    #User given values
    k::Int #Number of states
    r::Int #r-nearest neigbors

    #Internal values
    cells::Array{Int8, 3}

    function CA2d(B::Array{Int,1},
                  S::Array{Int,1},
                  init::Array{Int,2},
                  gen::Int,
                  k::Int=2,
                  r::Int=1)

        h, w = size(init)
        cells = Array(Int8, h, w, gen)
        cells[:, :, 1] = Array{Int8}(init[:, :])

        for g = 2:gen
            for i = 1:h, j = 1:w
                cc = -cells[i, j, g-1]
                for p = (i-r):(i+r), q = (j-r):(j+r)

                    #Cyclic boundary conditions
                    if p < 1; p = h-p; end
                    if p > h; p = p-h; end
                    if q < 1; q = w-q; end
                    if q > w; q = q-w; end

                    cc += cells[p, q, g-1]
                end
                cells[i, j, g] = eval_rule(cc, cells[i, j, g-1], B, S)
            end #hw ij
        end #gen

        new(k, r, cells)
    end
end

#Evaluate life rules
#TODO: make this more general
function eval_rule(cc, olds, B, S, k=2)
    if cc in B || (olds == 1 && cc in S)
        return 1
    end

    return 0
end

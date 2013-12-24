#1-dim CAs

#Wolfram elementary CA
type CA

    #user given values
    ruleset::Array{Int,1}

    #internal variables
    cells::Array{Int,2}

    function CA(rulen::Int, init::Array{Int,1}, gen::Int)
        ruleset = rule(rulen)

        w = length(init)
        cells = Array(Int, gen, w)
        cells[1,:] = init[:]'

        for i = 2:gen
            #Cyclic boundary conditions 
            ind = parseint(string(cells[i-1,w], cells[i-1,1], cells[i-1,2]), 2)
            cells[i,1] = ruleset[ind+1]
            for j = 2:w-1
                str = string(cells[i-1,j-1], cells[i-1,j], cells[i-1,j+1])
                ind = parseint(str, 2)
                cells[i,j] = ruleset[ind+1]
            end
            ind = parseint(string(cells[i-1,w-1], cells[i-1,w], cells[i-1,1]), 2)
            cells[i,w] = ruleset[ind+1]
        end

        new(ruleset, cells)
    end

#    function CA(rulen::Int, init::Array{Int,1}, bkg::Array{Int,1}, gen::Int)
#
#    end

end

#Parse rule numbering according to Wolfram code
function rule(n::Int)
    digits(n, 2, 8)
end



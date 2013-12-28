#2-dim CAs

#Two dimensional Cellular Automaton

#TODO: Change naming to be consistent
type CA2d

    #User given values
    k::Int #Number of states
    r::Int #r-nearest neigbors

    #Internal values
    cells::Array{Int8, 3}

    function CA2d(rule::Rational{Int}, init::Array{Int,2}, gen::Int, k::Int=2, r::Int=1)

        B = digits(num(rule)) #born
        S = digits(den(rule)) #survive



    end
end
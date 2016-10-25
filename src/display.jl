using CellularAutomata
using Tk
importall Cairo

function sim_life(init::Array{Int,2},B, S)
    m, n = size(init)
    w = Window("CA", n, m)
    c = Canvas(w)
    pack(c)

#    win = Toplevel("Cellular Automata", 600, 300)
#    f = Frame(win)
#    pack(f, expand = true, fill = "both")
#    c = Canvas(f)
#    pack(c, expand = true, fill = "both")


    done = false
    c.mouse.button1press = (c, x, y)->(done=true)
    cr = getgc(c)

    last = time(); f = 1
    while !done
        img = convert(Array{Uint32, 2}, init) .* 0x00ffffff
        set_source_surface(cr, CairoRGBSurface(img), 0, 0)
        paint(cr)
        reveal(c)

        t = time()
        if (t-last) > 2
            println("$(f/(t-last)) FPS")
            last = t; f = 0
        end
        M = CA2d(B, S, init, 2).cells
        init = Array{Int}(M[:, :, 2])
        f += 1
        sleep(0.01)
    end
end


#turbine pattern
#init = Array{Int}(zeros(20,20))
#init[4, 4:9] = 1
#init[5, 4:9] = 1

#init[4:9, 11] = 1
#init[4:9, 12] = 1

#init[11, 7:12] = 1
#init[12, 7:12] = 1

#init[7:12, 4] = 1
#init[7:12, 5] = 1

init = Array{Int}(zeros(600,600))
init[250:350, 250:350] = Array{Int}(rand(101,101))
#init[295:305, 295:305] = Array{Int}(rand(11,11))


#init = Array{Int}(rand(1000, 1000))

#game of life
sim_life(init,[3], [2,3])

#morley
#sim_life(init,[3,6,8],[2,4,5])

#2x2
#sim_life(init,[3,6],[1,2,5])

#replicator
#sim_life(init,[1,3,5,7], [1,3,5,7])

#dimoeba
#sim_life(init,[3,5,6,7,8], [5,6,7,8])

#no death
#sim_life(init,[3], [0,1,2,3,4,5,6,7,8])

#34 life
#sim_life(init,[3,4],[3,4])

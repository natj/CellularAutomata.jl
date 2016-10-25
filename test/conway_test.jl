module ConwayTest

using Base.Test

using CellularAutomata
export blinker_test, turbine_test

# Function to test Conway's blinker oscillator and toad oscillator
function blinker_test()
  init = Array{Int}(zeros(10,10))

  # 'Toad Oscillator'
  init[6, 4] = 1
  init[6, 5] = 1
  init[6, 6] = 1

  init[7, 5] = 1
  init[7, 6] = 1
  init[7, 7] = 1

  ca = CA2d([3], [2,3], init, 9);

  @test ca.cells[:, :, 3] == ca.cells[:, :, 1]
  @test ca.cells[:, :, 5] == ca.cells[:, :, 3]
  @test ca.cells[:, :, 4] == ca.cells[:, :, 2]
  @test ca.cells[:, :, 8] == ca.cells[:, :, 6]

  # 'Blinker Oscillator'
  init[6, 4] = 0
  init[6, 5] = 0
  init[6, 6] = 0

  ca = CA2d([3], [2,3], init, 9)

  @test ca.cells[:, :, 3] == ca.cells[:, :, 1]
  @test ca.cells[:, :, 5] == ca.cells[:, :, 3]
  @test ca.cells[:, :, 4] == ca.cells[:, :, 2]
  @test ca.cells[:, :, 8] == ca.cells[:, :, 6]
end

# Function to test Conway's turbine automota which repeats every ninth step
function turbine_test()
  init = Array{Int}(zeros(20,20))
  init[4, 4:9] = 1
  init[5, 4:9] = 1

  init[4:9, 11] = 1
  init[4:9, 12] = 1

  init[11, 7:12] = 1
  init[12, 7:12] = 1

  init[7:12, 4] = 1
  init[7:12, 5] = 1

  ca = CA2d([3], [2,3], init, 18)

  for i in 9:18
    @test ca.cells[:, :, i] == ca.cells[:, :, i-8]
  end
end
end

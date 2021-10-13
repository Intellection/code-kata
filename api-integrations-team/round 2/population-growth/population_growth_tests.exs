Code.load_file("population_growth.ex")

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule PopulationGrowthTests do
  use ExUnit.Case

  test "testing population" do
    assert PopulationGrowth.calculator(1500, 5, 100, 5000) == 15
  end

  test "testing population condition 2" do
    assert PopulationGrowth.calculator(1_500_000, 2.5, 10000, 2_000_000) == 10
  end
end

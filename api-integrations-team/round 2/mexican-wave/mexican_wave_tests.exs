Code.load_file("mexican_wave.ex")

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule MexicanWaveTests do
  use ExUnit.Case

  test "testing the wave with `hello`" do
    assert MexicanWave.wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  end

  test "testing the wave with `Round 2`" do
    assert PopulationGrowth.calculator(1_500_000, 2.5, 10000, 2_000_000) == 10
  end
end

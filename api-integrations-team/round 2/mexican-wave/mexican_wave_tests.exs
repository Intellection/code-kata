Code.load_file("mexican_wave.ex")

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule MexicanWaveTests do
  use ExUnit.Case

  test "testing the wave with `hello`" do
    assert MexicanWave.wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  end

end

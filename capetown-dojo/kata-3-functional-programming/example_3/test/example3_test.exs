defmodule Example3Test do
  use ExUnit.Case
  doctest Example3

  test "nb_year" do
    assert Example3.nb_year(1500, 5, 100, 5000) == 15
    assert Example3.nb_year(1500000, 2.5, 10000, 2000000) == 10
    assert Example3.nb_year(1500000, 0.25, 1000, 2000000) == 94
  end
end

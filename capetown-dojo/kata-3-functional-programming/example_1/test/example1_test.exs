defmodule Example1Test do
  use ExUnit.Case
  doctest Example1

  test "basic cases" do
    assert Example1.better_than_average([2, 3], 5) == true
    assert Example1.better_than_average([100, 40, 34, 57, 29, 72, 57, 88], 75) == true
    assert Example1.better_than_average([12, 23, 34, 45, 56, 67, 78, 89, 90], 9) == false
  end
end

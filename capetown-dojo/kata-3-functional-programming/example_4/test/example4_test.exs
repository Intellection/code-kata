defmodule Example4Test do
  use ExUnit.Case
  doctest Example4

  test "Are they the Same" do
    IO.puts("Test 1")
    a = [121, 144, 19, 161, 19, 144, 19, 11]
    b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
    assert Example4.comp(a, b) == true
    IO.puts("Test 2")
    assert Example4.comp([121, 144, 19, 161, 19, 144, 19, 11],
      [11*21, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == false
  end
end

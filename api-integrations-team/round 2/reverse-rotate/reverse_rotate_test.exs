Code.load_file("reverse_rotate.ex")

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ReverseRotateTest do
  use ExUnit.Case

  test "1" do
    assert ReverseRotate.rr("123456987654", 6) == "234561876549"
  end

  test "2" do
    assert ReverseRotate.rr("123456987653", 6) == "234561356789"
  end

  test "3" do
    assert ReverseRotate.rr("66443875", 4) == "44668753"
  end

  test "4" do
    assert ReverseRotate.rr("66443875", 8) == "64438756"
  end

  test "5" do
    assert ReverseRotate.rr("664438769", 8) == "67834466"
  end

  test "6" do
    assert ReverseRotate.rr("123456779", 8) == "23456771"
  end

  test "7" do
    assert ReverseRotate.rr("", 8) == ""
  end

  test "8" do
    assert ReverseRotate.rr("123456779", 0) == ""
  end

  test "9" do
    assert ReverseRotate.rr("563000655734469485", 4) == "0365065073456944"
  end
end

defmodule ReverseRotate do
  def rr(num, sz) do
    num
    |> String.to_integer()
    |> Integer.digits()
    |> Enum.chunk_every(sz, :discard)
    |> Enum.map(&rotate/1)
    |> Enum.map(&Integer.to_string/1)
    |> String.join()
  end

  def rotate(nums = [h | t]) do
    if rem(Enum.sum(nums), 2) == 0 do
      Enum.reverse(nums)
    else
      t ++ [h]
    end
  end
end

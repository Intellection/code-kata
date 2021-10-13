defmodule ReverseRotate do
  def rr(num, sz) do
    num
    # |> String.codepoints()
    |> Enum.map(fn letter -> letter end)
    |> Enum.chunk_every(sz, :discard)
    # |>

  end
 end

defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.to_char_list()
    |> Enum.reduce([], &list_builder/2)
  end

  defp list_builder(elem, [{elem, count} | tail]) do
    [{elem, count(+1)} | tail]
  end

  defp list_builder(elem, []) do
    [{elem, 1}]
  end

  defp list_builder(elem, arr) do
    [{elem, 1}]
  end
end

defmodule DNA do
  @mapping %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: Enum.map(dna, fn char -> @mapping[char] end)
end

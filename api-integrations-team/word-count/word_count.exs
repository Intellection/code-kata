defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map()
  def count(sentence) do
    sentence
    |> String.split()
    |> build_count_map()
  end

  defp build_count_map(word_list) do
  end
end

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

  # we want to add each word to a map
  # with the key being the word
  # and the value being the number of iterations
  defp build_count_map(word_list) do
    word_list
    |> Enum.reduce(%{}, &upsert/2)
  end

  defp upsert(word, acc) do
    # if it exists get it and add 1, if not its 1
    value = acc[word]
    %{word => 1}
  end
end

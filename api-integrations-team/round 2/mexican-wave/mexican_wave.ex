defmodule MexicanWave do
  def wave(word) do
    codepoints = String.codepoints(word)

    capitalise_letter = fn index ->
      letter = Enum.at(codepoints, index)
      List.replace_at(codepoints, index, String.upcase(letter)) |> Enum.join()
    end

    Enum.to_list(0..(String.length(word) - 1))
    |> Enum.map(capitalise_letter)
  end
end

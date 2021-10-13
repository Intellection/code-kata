defmodule MexicanWaveTests do
  def wave(word) do
 #   additional_year = fn initial ->
  #     initial * (1 + percentage_change * 0.01) + new_inhabitants
  #   end
    capitalise_letter = fn index
      # capitalised_word = word.capitalise_at(index)
      capitalised_word = word
    end

    Enum.to_list(0..String.length(word))
    |> Enum.map(capitalise_letter)

  end
end

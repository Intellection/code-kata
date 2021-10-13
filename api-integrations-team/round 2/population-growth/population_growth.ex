defmodule PopulationGrowth do
  # def calculator(initial, percentage_change, new_inhabitants, final) do
  #   additional_year = fn initial ->
  #     initial * (1 + percentage_change * 0.01) + new_inhabitants
  #   end

  #   {pop, year} = initial
  #                |> Stream.iterate(additional_year)
  #                |> Stream.with_index()
  #                |> Enum.find(fn {pop, index} -> pop > final end)

  #   year
  # end
  def calculator(initial, percentage_change, new_inhabitants, final, year \\ 0)
      when initial > final,
      do: year

  def calculator(initial, percentage_change, new_inhabitants, final, year) do
    new_initial = initial * (1 + percentage_change * 0.01) + new_inhabitants
    calculator(new_initial, percentage_change, new_inhabitants, final, year + 1)
  end
end

defmodule PopulationGrowth do
  def calculator(initial, percentage_change, new_inhabitants, final) do
    additional_year = fn initial ->
      initial * (1 + percentage_change * 0.01) + new_inhabitants
    end
    # Loop until initial > final
    #     (initial = intitial + intitial*percentage + new_inhabitants)
    Stream.iterate(initial, additional_year())
  end

  def additional_year(initial)
  end
  end
end

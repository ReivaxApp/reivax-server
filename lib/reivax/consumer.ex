defmodule Reivax.Consumer do
  @doc """
  Start the agent, with a search
  """
  def start_link() do
    Agent.start_link(consume_to_file(search_array))
  end

  """
  Consume twitter to a file
  """
  defp consume_to_file([{search_term, file} | tail]) do
    search_twitter(search_term)
    |> Enum.each(fn(x) -> File.write("#{file}.txt", x.text) end)
    :timer.sleep(10000)
    consume_to_file(tail ++ [{search_term, file}])
  end

  defp search_twitter(search_term)do
    stringify(search_term)
    |> ExTwitter.search
  end

  defp stringify(search_term) do
    Enum.map_join(search_term, " OR ", fn(x) -> "(#{x})" end)
  end

  """
  Get the search array
  """
  defp search_array do
    Application.get_env(:reivax, :search)
  end
end

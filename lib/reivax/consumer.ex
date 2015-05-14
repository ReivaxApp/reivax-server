defmodule Reivax.Consumer do
  @doc """
  Start the agent, with a search
  """
  def start_link(search) do
    Agent.start_link(consume_to_file(search))
  end

  """
  Consume twitter to a file
  """
  defp consume_to_file(search) do
    ExTwitter.stream_filter(track: search) |>
      Stream.map(fn(x) -> x.text end) |>
      Stream.map(fn(x) -> File.write!( "tweet.txt", "#{x}\n---------------\n", [:append]) end) |>
      Enum.to_list
  end
end

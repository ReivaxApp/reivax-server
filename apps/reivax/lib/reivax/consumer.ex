defmodule Reivax.Consumer do
  @sleep_time 10000

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
    channel = RSS.channel("Reivax", "http://dans.ton.cul", "Lol", "1979-01-01", "lang (fr-fr)")
    items = search_twitter(search_term)
    |> Enum.map(fn(x) -> create_items(x) end)
    feed = RSS.feed(channel, items)
    File.write("#{file}.rss", feed)
    :timer.sleep(@sleep_time)
    consume_to_file(tail ++ [{search_term, file}])
  end

  defp create_items(tweet) do
    RSS.item(tweet.text, tweet.text, tweet.created_at, "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id_str}", tweet.id_str)
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

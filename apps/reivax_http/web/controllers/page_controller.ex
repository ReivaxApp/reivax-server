defmodule ReivaxHttp.PageController do
  use ReivaxHttp.Web, :controller

  plug :action

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> put_resp_content_type("text/xml")
    |> text rss
  end

  defp rss do
    File.read("/home/m/code/elixir/twitter/dev.rss")
    |> elem 1
  end
end

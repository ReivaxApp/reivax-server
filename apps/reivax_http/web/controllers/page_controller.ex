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
    File.read(rss_file_path)
    |> elem 1
  end

  defp rss_file_path do
    Application.get_env(:reivax_http, :rss_file_path)
  end
end

defmodule Reivax do
  use Application

  def start(_type, _args) do
    Reivax.Supervisor.start_link
  end
end

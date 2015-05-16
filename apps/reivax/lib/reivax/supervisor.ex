defmodule Reivax.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Reivax.Manager, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

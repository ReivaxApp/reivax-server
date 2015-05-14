defmodule Reivax.Manager do
  use GenServer

  ## Client API

  @doc """
  Start the manager
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated to the given `name` in `server`.
  """
  def create(server, name, search) do
    GenServer.cast(server, {:create, name, search})
  end

  @doc """
  Stops the manager
  """
  def stop(server) do
    GenServer.call(server, :stop)
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, HashDict.new}
  end

  def handle_call({:lookup, name}, _from, names) do
    {:reply, HashDict.fetch(names, name), names}
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def handle_cast({:create, name, search}, names) do
    if HashDict.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, consumer} = Reivax.Consumer.start_link(search)
      {:noreply, HashDict.put(names, name, consumer)}
    end
  end
end

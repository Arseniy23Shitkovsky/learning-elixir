defmodule SumServer do
  use GenServer

  def init(_) do
    {:ok, %{}}
  end
  def start do
    GenServer.start(__MODULE__, nil)
  end

  def sum(server, a, b) do
    GenServer.call(server, {:sum, a, b})
  end

  def handle_call({:sum, a, b}, _from, state) do
    {:reply, a + b, state}
  end

  def stop(server) do
    GenServer.stop(server)
  end
end

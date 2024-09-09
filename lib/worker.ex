defmodule Worker do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, "", name: name)
  end

  def init(stack) do
    {:ok, stack}
  end

  def handle_call({:set, val}, _from, _stack) do
    {:reply, :ok, val}
  end

  def handle_call({:get}, _from, stack) do
    {:reply, stack, stack}
  end

  def set(name, val) do
    GenServer.call(name, {:set, val})
  end

  def get(name) do
    GenServer.call(name, {:get})
  end
end

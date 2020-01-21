defmodule RedisExample.Store do
  use GenServer

  ### GenServer API

  @doc """
  Функция обратного вызова для GenServer.init/1
  """
  def init(state), do: {:ok, state}

  @doc """
  Функции обратного вызова для GenServer.handle_call/3
  """
  def handle_call({:get, key}, _from, state) do
    {:reply, state["#{key}"], state}
  end

  def handle_call({:stop}, _from, state) do
    exit("oh no!")
    {:reply, 'AAAAAAAAAAAAA', state}
  end

  @doc """
  Функция обратного вызова для GenServer.handle_cast/2
  """
  def handle_cast({:set, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_cast({:del, key}, state) do
    {:noreply, Map.delete(state, "#{key}")}
  end

  def handle_cast({:flushdb}, _state) do
    {:noreply, %{}}
  end

  ### Клиентский API

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def set(key, value), do: GenServer.cast(__MODULE__, {:set, key, value})
  def get(key), do: GenServer.call(__MODULE__, {:get, key})
  def del(key), do: GenServer.cast(__MODULE__, {:del, key})
  def flushdb(), do: GenServer.cast(__MODULE__, {:flushdb})
  def stop(), do: GenServer.call(__MODULE__, {:stop})
end

defmodule DemoOtp.ClickCounterRegistry do
  use GenServer

  ## client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def lookup(server, website) do
    GenServer.call(server, {:lookup, website})
  end

  def create(server, website) do
    GenServer.cast(server, {:create, website})
  end

  # server

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:lookup, website}, _from, websites) do
    {:reply, Map.fetch(websites, website), websites}
  end

  def handle_cast({:create, website}, websites) do
    if Map.has_key?(websites, website) do
      {:noreply, websites}
    else
      {:ok, counter} = DemoOtp.ClickCounter.start_link([])
      {:noreply, Map.put(websites, website, counter)}
    end
  end
end

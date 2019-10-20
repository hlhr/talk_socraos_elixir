defmodule DemoOtp.ClickCounter do
  use Agent

  # client api

  def start_link(_opts) do
    Agent.start_link(fn -> 0 end)
  end

  def get_click_count(agent) do
    Agent.get(agent, fn counter -> counter end)
    # Agent.get(agent, & &1)
  end

  def register_click(agent) do
    Agent.update(agent, fn counter -> counter + 1 end)
    # Agent.update(agent, &(&1 + 1))
  end

  def reset(agent) do
    Agent.update(agent, fn _counter -> 0 end)
  end
end

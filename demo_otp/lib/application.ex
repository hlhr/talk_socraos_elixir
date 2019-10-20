defmodule DemoOtp do
  use Application

  def start(_type, _args) do
    DemoOtp.Supervisor.start_link(name: DemoOtp.Supervisor)
  end
end

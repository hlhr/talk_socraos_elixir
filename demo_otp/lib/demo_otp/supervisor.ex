defmodule DemoOtp.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      {DemoOtp.ClickCounterRegistry, name: DemoOtp.ClickCounterRegistry}
    ]

    # :one_for_one - if a child process terminates,
    #                 only that process is restarted.
    # :one_for_all - if a child process terminates,
    #                 all other child processes are terminated
    #                 and then all child processes are restarted.
    # :rest_for_one - if a child process terminates,
    #                  the terminated child process and the rest of the children started after it,
    #                  are terminated and restarted.
    Supervisor.init(children, strategy: :one_for_one)
  end
end

defmodule TrDaisy3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TrDaisy3.Repo,
      # Start the Telemetry supervisor
      TrDaisy3Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TrDaisy3.PubSub},
      # Start the Endpoint (http/https)
      TrDaisy3Web.Endpoint
      # Start a worker by calling: TrDaisy3.Worker.start_link(arg)
      # {TrDaisy3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TrDaisy3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TrDaisy3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end

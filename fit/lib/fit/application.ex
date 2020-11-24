defmodule Fit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Fit.Repo,
      # Start the Telemetry supervisor
      FitWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fit.PubSub},
      # Start the Endpoint (http/https)
      FitWeb.Endpoint
      # Start a worker by calling: Fit.Worker.start_link(arg)
      # {Fit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

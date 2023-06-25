defmodule SustentaMais.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SustentaMaisWeb.Telemetry,
      # Start the Ecto repository
      SustentaMais.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SustentaMais.PubSub},
      # Start Finch
      {Finch, name: SustentaMais.Finch},
      # Start the Endpoint (http/https)
      SustentaMaisWeb.Endpoint
      # Start a worker by calling: SustentaMais.Worker.start_link(arg)
      # {SustentaMais.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SustentaMais.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SustentaMaisWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

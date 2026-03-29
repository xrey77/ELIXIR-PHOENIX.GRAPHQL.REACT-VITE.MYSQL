defmodule ElixirGraphqlMysql.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirGraphqlMysqlWeb.Telemetry,
      ElixirGraphqlMysql.Repo,
      {DNSCluster, query: Application.get_env(:elixir_graphql_mysql, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirGraphqlMysql.PubSub},
      # Start a worker by calling: ElixirGraphqlMysql.Worker.start_link(arg)
      # {ElixirGraphqlMysql.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirGraphqlMysqlWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirGraphqlMysql.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirGraphqlMysqlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

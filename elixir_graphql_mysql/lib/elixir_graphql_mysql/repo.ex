defmodule ElixirGraphqlMysql.Repo do
  use Ecto.Repo,
    otp_app: :elixir_graphql_mysql,
    adapter: Ecto.Adapters.MyXQL
end

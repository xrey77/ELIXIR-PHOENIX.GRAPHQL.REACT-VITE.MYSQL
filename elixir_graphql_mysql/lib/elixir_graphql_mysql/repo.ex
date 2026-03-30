# lib/elixir_graphql_mysql/repo.ex
defmodule ElixirGraphqlMysql.Repo do
  use Ecto.Repo, otp_app: :elixir_graphql_mysql, adapter: Ecto.Adapters.MyXQL
  use Scrivener, page_size: 5 # Default page size
#  use Ecto.Repo,
#    otp_app: :elixir_graphql_mysql,
#    adapter: Ecto.Adapters.MyXQL
end

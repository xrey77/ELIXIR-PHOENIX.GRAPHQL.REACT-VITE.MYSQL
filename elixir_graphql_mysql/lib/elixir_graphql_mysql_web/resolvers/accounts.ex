# lib/elixir_graphql_mysql_web/resolvers/accounts.ex
defmodule ElixirGraphqlMysqlWeb.Resolvers.Accounts do
  alias ElixirGraphqlMysql.Accounts

  def find_user(_parent, %{id: id}, _resolution) do
    {:ok, Accounts.get_user!(id)}
  end

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}
  end
end

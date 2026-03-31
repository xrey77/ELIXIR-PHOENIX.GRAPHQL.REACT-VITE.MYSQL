# lib/elixir_graphql_mysql_web/resolvers/catalogs.ex
defmodule ElixirGraphqlMysqlWeb.Resolvers.Catalogs do
  alias ElixirGraphqlMysql.Catalog

  def list_products(_parent, _args, _resolution) do
    {:ok, Catalog.list_products()}
  end
end

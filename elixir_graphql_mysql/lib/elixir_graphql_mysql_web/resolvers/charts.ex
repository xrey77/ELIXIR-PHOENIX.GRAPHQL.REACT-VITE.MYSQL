# lib/elixir_graphql_mysql_web/resolvers/charts.ex
defmodule ElixirGraphqlMysqlWeb.Resolvers.Charts do
  alias ElixirGraphqlMysql.Chart

  def list_sales(_parent, _args, _resolution) do
    {:ok, Chart.list_sales()}
  end
end

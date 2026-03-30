#lib/elixir_graphql_mysql_web/graphql/types/types.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.Types do
  use Absinthe.Schema.Notation

  scalar :decimal do
    parse fn %Absinthe.Blueprint.Input.String{value: value} ->
      {:ok, Decimal.new(value)}
    end
    serialize &Decimal.to_float/1
  end
end

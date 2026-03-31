# lib/elixir_graphql_mysql_web/graphql/types/sales_types.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.SalesTypes do

  use Absinthe.Schema.Notation

  object :sale do
    field :id, :id
    field :salesamount, :decimal
    field :salesdate, :string
  end
end

# lib/elixir_graphql_mysql_web/graphql/types/products_type.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.ProductsType do

  use Absinthe.Schema.Notation

  object :product_type do
    field :id, :id
    field :category, :string
    field :descriptions, :string
    field :qty, :integer
    field :unit, :string
    field :costprice, :decimal
    field :sellprice, :decimal
    field :saleprice, :decimal
    field :productpicture, :string
    field :alertstocks, :integer
    field :criticalstocks, :integer
  end
end

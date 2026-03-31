# lib/elixir_graphql_mysql_web/graphql/types/category_type.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.CategoryType do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.ProductResolver

  object :category_type do
    field :id, :id
    field :name, :string
    
    field :products, list_of(:product_type) do
      resolve &ProductResolver.list_products_by_category/3
    end
  end
end

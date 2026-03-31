# lib/elixir_graphql_mysql_web/graphql/queries/product_category.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.ProductCategory do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.ProductResolver

  object :product_category_queries do
    @desc "Get product by category"
    field :categories, list_of(:category_type) do
        resolve &ProductResolver.list_categories/3
    end    
  end
end


#REQUEST
#query ProductbyCategory{
#   categories{
#       name
#       products{
#            id
#            descriptions
#            qty
#            unit
#            costprice
#            sellprice
#            saleprice
#            productpicture
#            alertstocks
#            criticalstocks
#       }
#   }
#}
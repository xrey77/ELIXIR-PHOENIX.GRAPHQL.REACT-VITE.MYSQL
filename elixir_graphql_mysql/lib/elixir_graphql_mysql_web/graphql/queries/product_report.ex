# lib/elixir_graphql_mysql_web/graphql/queries/product_report.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.ProductReport do
  use Absinthe.Schema.Notation

  object :product_report do
    @desc "Get all products data"
    field :all_products, list_of(:product_type) do
      resolve &ElixirGraphqlMysqlWeb.Resolvers.Catalogs.list_products/3
    end
  end
end


#======REQUEST==========
#query GetProudcts {
#    allProducts{
#        id
#        category
#        descriptions
#        qty
#        unit
#        costprice
#        sellprice
#        saleprice
#        productpicture
#        alertstocks
#        criticalstocks
#    }
#}
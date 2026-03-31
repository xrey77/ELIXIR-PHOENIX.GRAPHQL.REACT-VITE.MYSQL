# lib/elixir_graphql_mysql_web/graphql/queries/sales_query.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.SalesQuery do
  use Absinthe.Schema.Notation

  object :sales_queries do
    @desc "Get all sales data"
    field :all_sales, list_of(:sale) do
      resolve &ElixirGraphqlMysqlWeb.Resolvers.Charts.list_sales/3
    end
  end
end


#======REQUEST========
#query GetSales{
#    allSales{
#        id
#        salesamount
#        salesdate
#    }
#}
# lib/elixir_graphql_mysql_web/graphql/queries/products_list.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.ProductsList do
  use Absinthe.Schema.Notation

  object :products_list do
    field :product, :productpage do
      arg :page, non_null(:integer)
      resolve &find_products/3
    end
  end

  def find_products(_parent, %{page: page}, _resolution) do
    results = ElixirGraphqlMysql.Catalog.list_products_paginated(page)
    {:ok, results}
  end
end


#=====REQUEST======
#query GetProducts($pageNumber: Int!) {
#  product(page: $pageNumber) {
#    total_entries
#    total_pages
#    current_page
#    entries {
#      id
#      category
#      descriptions
#      sellprice
#    }
#  }
#}


#====VARIABLES====
#{
#  "pageNumber": 1
#}
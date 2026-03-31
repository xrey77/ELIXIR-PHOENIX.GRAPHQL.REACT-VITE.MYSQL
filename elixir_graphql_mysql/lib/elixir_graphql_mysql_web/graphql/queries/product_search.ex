# lib/elixir_graphql_mysql_web/graphql/queries/products_search.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.ProductsSearch do
  use Absinthe.Schema.Notation

  object :products_search_queries do
    @desc "Search products with pagination and keyword"
        field :product_search, :product_pageinfo do
        arg :page, non_null(:integer)
        arg :keyword, non_null(:string)
        
        
        resolve fn _, %{page: page, keyword: keyword}, _ ->
            
            pagination = ElixirGraphqlMysql.Catalog.search_products_paginated(%{
                page: page, 
                filter: %{descriptions: keyword}
            })            

            if pagination.total_entries == 0 do
                {:error, message: "Product(s) not found.", code: 403, details: "Missing token"}
            else
                {:ok, %{
                entries: pagination.entries,
                total_pages: pagination.total_pages,
                total_entries: pagination.total_entries,
                current_page: pagination.page_number
                }}
            end
        end
        end
  end
end


#========REQUEST====================
#query SearchForProducts($pageNumber: Int!, $keyword: String!) {    
#    productSearch(page: $pageNumber, keyword: $keyword) {                   
#        totalPages
#        totalEntries   
#        currentPage
#        entries{
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
#        }
#    }
#}


#====VARIABLES=====
#{
#    "pageNumber": 3,
#    "keyword": "cineo"
#}
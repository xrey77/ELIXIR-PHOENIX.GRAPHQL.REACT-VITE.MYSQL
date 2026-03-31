#lib/elixir_graphql_mysql_web/graphql/types/product_pageinfo.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.ProductPageInfo do
    use Absinthe.Schema.Notation

    object :product_pageinfo do
        field :entries, list_of(:product)
        field :total_pages, :integer
        field :total_entries, :integer
        field :current_page, :integer         
    end

end
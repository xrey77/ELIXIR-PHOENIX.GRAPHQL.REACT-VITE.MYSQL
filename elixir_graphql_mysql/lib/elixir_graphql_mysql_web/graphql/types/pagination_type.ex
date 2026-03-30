#lib/elixir_graphql_mysql_web/graphql/types/pagination_type.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.PaginationType do
  use Absinthe.Schema.Notation
  import_types ElixirGraphqlMysqlWeb.Graphql.Types.Types

  object :product do
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

  object :productpage do
    field :entries, list_of(:product)
    field :total_pages, :integer
    field :total_entries, :integer
    field :current_page, :integer, resolve: fn page, _, _ ->
      {:ok, page.page_number}
    end
  end
end
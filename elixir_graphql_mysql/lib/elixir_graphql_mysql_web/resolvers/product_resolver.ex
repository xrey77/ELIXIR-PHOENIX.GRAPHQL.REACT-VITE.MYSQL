# lib/elixir_graphql_mysql_web/graphql/resolvers/product_resolver.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.ProductResolver do
  alias ElixirGraphqlMysql.Catalog

  # This is called when resolving the 'products' field inside 'category_type'
  def list_products_by_category(category, _args, _resolution) do
    # 'category' here is the parent object containing the ID
    products = Catalog.list_products(category_id: category.id)
    {:ok, products}
  end

  # You might also want a generic list for the top-level query
  def list_categories(_parent, _args, _resolution) do
    {:ok, Catalog.list_categories()}
  end
end





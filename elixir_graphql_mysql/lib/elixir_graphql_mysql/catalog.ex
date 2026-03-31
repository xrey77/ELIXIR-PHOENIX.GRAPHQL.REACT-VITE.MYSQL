#lib/elixir_graphql_mysql/catalog.ex
defmodule ElixirGraphqlMysql.Catalog do

  import Ecto.Query
  alias ElixirGraphqlMysql.Repo

  alias ElixirGraphqlMysql.Catalog.Product


  def list_products(filter) when is_list(filter) or is_map(filter) do
    Product

    |> maybe_filter_by_category(filter)
    |> Repo.all()
  end

  defp maybe_filter_by_category(query, _), do: query


  def list_products do
    Repo.all(Product)
  end

  def list_products_paginated(page) do
    Product

    |> order_by(asc: :id)
    |> Repo.paginate(page: page) # Returns %Scrivener.Page{}
  end


  #Search and custom pagination
  @page_size 5
  def search_products_paginated(args) do
    page = Map.get(args, :page, 1)
    filter = Map.get(args, :filter, %{})

    Product

    |> maybe_filter_by_descriptions(filter)
    |> order_by(asc: :id)
    |> Repo.paginate(page: page, page_size: @page_size) 
  end

  # Case 1: Filter exists and is a non-empty string
  defp maybe_filter_by_descriptions(query, %{descriptions: desc}) when is_binary(desc) and desc != "" do
    search_term = "%#{desc}%"
    where(query, [p], like(p.descriptions, ^search_term))
  end

  # Case 2: Filter is missing, empty, or doesn't match the map key
  defp maybe_filter_by_descriptions(query, _), do: query


  def get_product!(id), do: Repo.get!(Product, id)

  def create_product(attrs) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias ElixirGraphqlMysql.Catalog.Category

  def list_categories do
    Repo.all(Category)
  end

  def get_category!(id), do: Repo.get!(Category, id)

  def create_category(attrs) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end
end

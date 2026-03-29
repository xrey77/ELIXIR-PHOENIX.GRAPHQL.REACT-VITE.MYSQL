defmodule ElixirGraphqlMysql.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirGraphqlMysql.Catalog` context.
  """

  @doc """
  Generate a unique product descriptions.
  """
  def unique_product_descriptions, do: "some descriptions#{System.unique_integer([:positive])}"

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        alertstocks: 42,
        category: "some category",
        costprice: "120.5",
        criticalstocks: 42,
        descriptions: unique_product_descriptions(),
        productpicture: "some productpicture",
        qty: 42,
        saleprice: "120.5",
        sellprice: "120.5",
        unit: "some unit"
      })
      |> ElixirGraphqlMysql.Catalog.create_product()

    product
  end

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ElixirGraphqlMysql.Catalog.create_category()

    category
  end
end

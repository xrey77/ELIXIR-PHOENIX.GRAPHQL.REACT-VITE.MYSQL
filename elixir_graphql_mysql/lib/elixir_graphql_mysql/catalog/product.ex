defmodule ElixirGraphqlMysql.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :category, :string
    field :descriptions, :string
    field :qty, :integer
    field :unit, :string
    field :costprice, :decimal, default: 0.00
    field :sellprice, :decimal, default: 0.00
    field :saleprice, :decimal, default: 0.00
    field :productpicture, :string
    field :alertstocks, :integer, default: 0
    field :criticalstocks, :integer, default: 0

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:category, :descriptions, :qty, :unit, :costprice, :sellprice, :saleprice, :productpicture, :alertstocks, :criticalstocks])
    |> validate_required([:category, :descriptions, :qty, :unit, :costprice, :sellprice, :saleprice, :productpicture, :alertstocks, :criticalstocks])
    |> unique_constraint(:descriptions)
  end
end

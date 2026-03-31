defmodule ElixirGraphqlMysql.Chart do

  import Ecto.Query, warn: false
  alias ElixirGraphqlMysql.Repo

  alias ElixirGraphqlMysql.Chart.Sale

  def list_sales do
    Repo.all(Sale)
  end

  def get_sale!(id), do: Repo.get!(Sale, id)

  def create_sale(attrs) do
    %Sale{}
    |> Sale.changeset(attrs)
    |> Repo.insert()
  end

  def update_sale(%Sale{} = sale, attrs) do
    sale
    |> Sale.changeset(attrs)
    |> Repo.update()
  end

  def delete_sale(%Sale{} = sale) do
    Repo.delete(sale)
  end

  def change_sale(%Sale{} = sale, attrs \\ %{}) do
    Sale.changeset(sale, attrs)
  end
end

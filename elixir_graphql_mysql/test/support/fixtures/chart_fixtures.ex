defmodule ElixirGraphqlMysql.ChartFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirGraphqlMysql.Chart` context.
  """

  @doc """
  Generate a sale.
  """
  def sale_fixture(attrs \\ %{}) do
    {:ok, sale} =
      attrs
      |> Enum.into(%{
        salesamount: "120.5",
        salesdate: ~U[2026-03-28 02:39:00Z]
      })
      |> ElixirGraphqlMysql.Chart.create_sale()

    sale
  end
end

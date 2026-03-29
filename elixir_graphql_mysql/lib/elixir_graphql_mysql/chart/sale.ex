defmodule ElixirGraphqlMysql.Chart.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field :salesamount, :decimal
    field :salesdate, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:salesamount, :salesdate])
    |> validate_required([:salesamount, :salesdate])
  end
end

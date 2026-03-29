defmodule ElixirGraphqlMysql.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :salesamount, :decimal
      add :salesdate, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end

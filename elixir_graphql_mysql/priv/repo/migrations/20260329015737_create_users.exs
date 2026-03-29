defmodule ElixirGraphqlMysql.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :mobile, :string
      add :username, :string
      add :password, :string
      add :isactivated, :boolean, default: false, null: false
      add :isblocked, :boolean, default: false, null: false
      add :mailtoken, :integer
      add :userpic, :string
      add :secret, :text
      add :qrcodeurl, :text

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end

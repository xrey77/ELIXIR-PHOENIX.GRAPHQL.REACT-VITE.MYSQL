defmodule ElixirGraphqlMysql.Repo.Migrations.CreateProductCategories do
  use Ecto.Migration

  def change do
    create table(:products_categories, primary_key: false) do
        add :product_id, references(:products, on_delete: :delete_all)
        add :category_id, references(:categories, on_delete: :delete_all)
      end

      create unique_index(:products_categories, [:product_id, :category_id])

  end
end

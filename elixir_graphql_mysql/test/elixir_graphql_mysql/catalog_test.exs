defmodule ElixirGraphqlMysql.CatalogTest do
  use ElixirGraphqlMysql.DataCase

  alias ElixirGraphqlMysql.Catalog

  describe "products" do
    alias ElixirGraphqlMysql.Catalog.Product

    import ElixirGraphqlMysql.CatalogFixtures

    @invalid_attrs %{unit: nil, category: nil, descriptions: nil, qty: nil, costprice: nil, sellprice: nil, saleprice: nil, productpicture: nil, alertstocks: nil, criticalstocks: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{unit: "some unit", category: "some category", descriptions: "some descriptions", qty: 42, costprice: "120.5", sellprice: "120.5", saleprice: "120.5", productpicture: "some productpicture", alertstocks: 42, criticalstocks: 42}

      assert {:ok, %Product{} = product} = Catalog.create_product(valid_attrs)
      assert product.unit == "some unit"
      assert product.category == "some category"
      assert product.descriptions == "some descriptions"
      assert product.qty == 42
      assert product.costprice == Decimal.new("120.5")
      assert product.sellprice == Decimal.new("120.5")
      assert product.saleprice == Decimal.new("120.5")
      assert product.productpicture == "some productpicture"
      assert product.alertstocks == 42
      assert product.criticalstocks == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{unit: "some updated unit", category: "some updated category", descriptions: "some updated descriptions", qty: 43, costprice: "456.7", sellprice: "456.7", saleprice: "456.7", productpicture: "some updated productpicture", alertstocks: 43, criticalstocks: 43}

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.unit == "some updated unit"
      assert product.category == "some updated category"
      assert product.descriptions == "some updated descriptions"
      assert product.qty == 43
      assert product.costprice == Decimal.new("456.7")
      assert product.sellprice == Decimal.new("456.7")
      assert product.saleprice == Decimal.new("456.7")
      assert product.productpicture == "some updated productpicture"
      assert product.alertstocks == 43
      assert product.criticalstocks == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "categories" do
    alias ElixirGraphqlMysql.Catalog.Category

    import ElixirGraphqlMysql.CatalogFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Catalog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Catalog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Catalog.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Catalog.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_category(category, @invalid_attrs)
      assert category == Catalog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Catalog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Catalog.change_category(category)
    end
  end
end

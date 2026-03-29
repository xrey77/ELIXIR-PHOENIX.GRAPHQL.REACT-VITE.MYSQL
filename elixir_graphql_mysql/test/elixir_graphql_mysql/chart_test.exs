defmodule ElixirGraphqlMysql.ChartTest do
  use ElixirGraphqlMysql.DataCase

  alias ElixirGraphqlMysql.Chart

  describe "sales" do
    alias ElixirGraphqlMysql.Chart.Sale

    import ElixirGraphqlMysql.ChartFixtures

    @invalid_attrs %{salesamount: nil, salesdate: nil}

    test "list_sales/0 returns all sales" do
      sale = sale_fixture()
      assert Chart.list_sales() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Chart.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      valid_attrs = %{salesamount: "120.5", salesdate: ~U[2026-03-28 02:39:00Z]}

      assert {:ok, %Sale{} = sale} = Chart.create_sale(valid_attrs)
      assert sale.salesamount == Decimal.new("120.5")
      assert sale.salesdate == ~U[2026-03-28 02:39:00Z]
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chart.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      update_attrs = %{salesamount: "456.7", salesdate: ~U[2026-03-29 02:39:00Z]}

      assert {:ok, %Sale{} = sale} = Chart.update_sale(sale, update_attrs)
      assert sale.salesamount == Decimal.new("456.7")
      assert sale.salesdate == ~U[2026-03-29 02:39:00Z]
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Chart.update_sale(sale, @invalid_attrs)
      assert sale == Chart.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Chart.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Chart.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Chart.change_sale(sale)
    end
  end
end

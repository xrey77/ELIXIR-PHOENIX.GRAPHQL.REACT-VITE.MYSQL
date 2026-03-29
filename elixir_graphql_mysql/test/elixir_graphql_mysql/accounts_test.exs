defmodule ElixirGraphqlMysql.AccountsTest do
  use ElixirGraphqlMysql.DataCase

  alias ElixirGraphqlMysql.Accounts

  describe "users" do
    alias ElixirGraphqlMysql.Accounts.User

    import ElixirGraphqlMysql.AccountsFixtures

    @invalid_attrs %{username: nil, password: nil, firstname: nil, lastname: nil, email: nil, mobile: nil, isactivated: nil, isblocked: nil, mailtoken: nil, userpic: nil, secret: nil, qrcodeurl: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{username: "some username", password: "some password", firstname: "some firstname", lastname: "some lastname", email: "some email", mobile: "some mobile", isactivated: true, isblocked: true, mailtoken: 42, userpic: "some userpic", secret: "some secret", qrcodeurl: "some qrcodeurl"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.username == "some username"
      assert user.password == "some password"
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
      assert user.email == "some email"
      assert user.mobile == "some mobile"
      assert user.isactivated == true
      assert user.isblocked == true
      assert user.mailtoken == 42
      assert user.userpic == "some userpic"
      assert user.secret == "some secret"
      assert user.qrcodeurl == "some qrcodeurl"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{username: "some updated username", password: "some updated password", firstname: "some updated firstname", lastname: "some updated lastname", email: "some updated email", mobile: "some updated mobile", isactivated: false, isblocked: false, mailtoken: 43, userpic: "some updated userpic", secret: "some updated secret", qrcodeurl: "some updated qrcodeurl"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.username == "some updated username"
      assert user.password == "some updated password"
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
      assert user.email == "some updated email"
      assert user.mobile == "some updated mobile"
      assert user.isactivated == false
      assert user.isblocked == false
      assert user.mailtoken == 43
      assert user.userpic == "some updated userpic"
      assert user.secret == "some updated secret"
      assert user.qrcodeurl == "some updated qrcodeurl"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "roles" do
    alias ElixirGraphqlMysql.Accounts.Role

    import ElixirGraphqlMysql.AccountsFixtures

    @invalid_attrs %{name: nil}

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Accounts.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Accounts.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Role{} = role} = Accounts.create_role(valid_attrs)
      assert role.name == "some name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Role{} = role} = Accounts.update_role(role, update_attrs)
      assert role.name == "some updated name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_role(role, @invalid_attrs)
      assert role == Accounts.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Accounts.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_role(role)
    end
  end
end

defmodule ElixirGraphqlMysql.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirGraphqlMysql.Accounts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        firstname: "some firstname",
        isactivated: true,
        isblocked: true,
        lastname: "some lastname",
        mailtoken: 42,
        mobile: "some mobile",
        password: "some password",
        qrcodeurl: "some qrcodeurl",
        secret: "some secret",
        username: unique_user_username(),
        userpic: "some userpic"
      })
      |> ElixirGraphqlMysql.Accounts.create_user()

    user
  end

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ElixirGraphqlMysql.Accounts.create_role()

    role
  end
end

# lib/elixir_graphql_mysql_web/graphql/resolvers/loginUser.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.LoginUser do
  alias ElixirGraphqlMysql.Accounts
  alias ElixirGraphqlMysqlWeb.Endpoint

  def login_user(_parent, %{input: %{username: username, password: password}}, _resolution) do
    case Accounts.get_username(username) do
      nil ->
        Bcrypt.no_user_verify()
        {:error, "Username not found, please register."}

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          token = Phoenix.Token.sign(Endpoint, "user salt", user.id)
          {:ok, %{
            token: token,
            message: "Logged in successfully",
            user: user}}
        else
          {:error, "Invalid password, please try again."}
        end
    end
  end
end

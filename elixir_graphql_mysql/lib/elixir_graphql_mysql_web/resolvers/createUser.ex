# lib/elixir_graphql_mysql_web/graphql/resolvers/createUser.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.Accounts do
  alias ElixirGraphqlMysql.Accounts

  def create_user(_parent, %{input: params}, _resolution) do
    case Accounts.create_user(params) do
      {:ok, user} -> 
        {:ok, %{
          message: "You have registered successfully, please login now.",
          user: user
        }}

      {:error, changeset} -> 
        {:error, transform_to_absinthe_errors(changeset)}      
    end
  end

  defp transform_to_absinthe_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        # Standard Ecto error message interpolation
        Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
        end)
    end)

    |> Enum.map(fn {field, messages} ->
        # Format for Absinthe: %{message: "...", field: "..."}
        %{message: "#{field |> Phoenix.Naming.humanize()} #{List.first(messages)}", field: field}
    end)
  end
end
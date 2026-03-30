# lib/elixir_graphql_mysql_web/graphql/resolvers/updateProfile.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.UpdateProfile do
    alias ElixirGraphqlMysql.Accounts

    def update_profile(_parent, %{input: input}, _resolution) do
     case Accounts.get_user(input.id) do
        nil ->
        {:error, "User ID not found."}

        user ->
        case Accounts.update_profile(user, input) do
            {:ok, _user} -> 
            {:ok, %{message: "Profile updated successfully"}}
            {:error, %Ecto.Changeset{} = changeset} -> 
            {:error, message: "Validation failed", details: traverse_errors(changeset)}
        end
     end
    end

    defp traverse_errors(changeset) do
     Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
        end)
     end)
    end

end

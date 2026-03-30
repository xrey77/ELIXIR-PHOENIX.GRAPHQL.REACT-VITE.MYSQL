# lib/elixir_graphql_mysql_web/graphql/resolvers/updatePassword.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.UpdatePassword do
    alias ElixirGraphqlMysql.Accounts

    def update_password(_parent, %{input: input}, _resolution) do
     case Accounts.get_user(input.id) do
        nil ->
        {:error, "User ID not found."}

        user ->
        case Accounts.update_password(user, input) do
            {:ok, _user} -> 
            {:ok, %{message: "You have changed your password successfully."}}
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



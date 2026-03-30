# lib/elixir_graphql_mysql_web/graphql/resolvers/uploadPicture.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.UploadPicture do
  alias ElixirGraphqlMysql.Accounts
  alias ElixirGraphqlMysql.Repo # Ensure Repo is aliased

  def upload_picture(_parent, %{input: input}, _resolution) do
    case Accounts.get_user(input.id) do
      nil ->
        {:error, "User ID not found."}

      user ->
        # 1. Process the file (assuming Accounts.upload_picture handles the physical file)
        case Accounts.upload_picture(user, input) do
          {:ok, _uploaded_info} ->
            extension = Path.extname(input.file.filename)
            newfile = "00#{input.id}#{extension}"

            # 2. Use a changeset to mark the field for update
            user

            |> Ecto.Changeset.change(%{userpic: newfile})            
            |> Repo.update() # 3. Persist the change
            |> case do
              {:ok, updated_user} ->
                {:ok, %{
                  user: updated_user,
                  message: "You have changed your profile picture successfully."
                }}
              {:error, changeset} ->
                {:error, message: "Database update failed", details: traverse_errors(changeset)}
            end

          #{:error, %Ecto.Changeset{} = changeset} ->
            {:error, reason} ->
                {:error, message: "File upload failed", details: reason}          
#            {:error, userpic: nil, message: "Validation failed", details: traverse_errors(changeset)}
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



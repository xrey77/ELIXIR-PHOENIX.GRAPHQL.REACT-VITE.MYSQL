# lib/elixir_graphql_mysql_web/graphql/resolvers/uploadPicture.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.UploadPicture do
  alias ElixirGraphqlMysql.Accounts
  alias ElixirGraphqlMysql.Repo

  # Pattern match directly on :id and :file
  def upload_picture(_parent, %{id: id, file: file}, _resolution) do

    priv_path = :code.priv_dir(:elixir_graphql_mysql) # Replace with your actual :app_name
    upload_dir = Path.join([priv_path, "static", "users"])

    # 2. Ensure the directory exists
    File.mkdir_p!(upload_dir)

    case Accounts.get_user(id) do
      nil ->
        {:error, "User ID not found."}

      user ->
        # Pass file directly or as a map if your Accounts logic expects it
        case Accounts.upload_picture(user, %{file: file}) do
          {:ok, _uploaded_info} ->
            extension = Path.extname(file.filename)
            newfile = "00#{id}#{extension}"

            user

            |> Ecto.Changeset.change(%{userpic: newfile})            
            |> Repo.update()
            |> case do
              {:ok, updated_user} ->
                {:ok, %{
                  user: updated_user,
                  message: "You have changed your profile picture successfully."
                }}
              {:error, changeset} ->
                {:error, message: "Database update failed", details: traverse_errors(changeset)}
            end

          {:error, reason} ->
            {:error, message: "File upload failed", details: reason}
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



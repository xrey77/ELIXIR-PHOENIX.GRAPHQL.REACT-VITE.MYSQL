##/lib/elixir_graphql_mysql/accounts.ex
defmodule ElixirGraphqlMysql.Accounts do

  import Ecto.Query, warn: false

  alias ElixirGraphqlMysql.Repo
  alias ElixirGraphqlMysql.Accounts.User


  def list_users do
    Repo.all(User)
  end

  def get_user(id), do: Repo.get(User, id)

  def get_user!(id), do: Repo.get!(User, id)

  def get_username(username) do
    Repo.get_by(User, username: username)
  end

  def create_user(attrs) do
    %User{}
    ##|> User.changeset(attrs)
    |> User.create_changeset(attrs)    
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias ElixirGraphqlMysql.Accounts.Role

  def list_roles do
    Repo.all(Role)
  end

  def create_role(attrs) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  def update_profile(%User{} = user, attrs) do
    user
    |> User.profile_changeset(attrs)
    |> Repo.update()
  end

  def update_password(%User{} = user, attrs) do
    user
    |> User.password_changeset(attrs)
    |> Repo.update()
  end

  def update_mfa(%User{} = user, attrs) do
    user
    |> User.mfa_changeset(attrs)
    |> Repo.update()
  end

  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

  def upload_picture(user, %{file: %Plug.Upload{path: temp_path, filename: filename}}) do
    # 1. Define the destination directory
    dest_dir = Path.join([:code.priv_dir(:elixir_graphql_mysql), "static", "users"])
    
    # 2. Ensure the directory exists
    File.mkdir_p!(dest_dir)

    # 3. Create a unique filename to prevent overwriting
    unique_filename = "#{user.id}-#{DateTime.utc_now() |> DateTime.to_unix()}-#{filename}"
    dest_path = Path.join(dest_dir, unique_filename)

    # 4. Copy the file from the temp path to the destination
    case File.cp(temp_path, dest_path) do
      :ok ->
        # Optional: Save the unique_filename to your User database record here
        # Ecto.Changeset.change(user, avatar_url: unique_filename) |> Repo.update()
        {:ok, user}

      {:error, reason} ->
        {:error, "Failed to save file: #{reason}"}
    end
  end

end

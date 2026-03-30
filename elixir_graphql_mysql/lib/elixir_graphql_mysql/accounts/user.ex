#lib/elixir_graphql_mysql/accounts/user.ex
defmodule ElixirGraphqlMysql.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :mobile, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :role_id, :integer
    field :isactivated, :boolean, default: true
    field :isblocked, :boolean, default: false
    field :mailtoken, :integer, default: 0
    field :userpic, :string, default: "pix.png"
    field :secret, :string
    field :qrcodeurl, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email, :mobile, :username, :password, :isactivated, :isblocked, :mailtoken, :userpic, :secret, :qrcodeurl])
    |> validate_required([:firstname, :lastname, :email, :mobile, :username, :password, :isactivated, :isblocked, :mailtoken, :userpic, :secret, :qrcodeurl])
    |> put_password_hash()    
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end


 def create_changeset(user, attrs) do
    user

    |> cast(attrs, [:firstname, :lastname, :email,  :mobile, :username, :password])
    |> validate_required([:username, :email, :password])
    |> put_password_hash()    
    |> put_change(:role_id, 2)     
    |> put_change(:secret, nil)     
    |> put_change(:qrcodeurl, nil)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
 end

def profile_changeset(user, attrs) do
  user

  |> cast(attrs, [:firstname, :lastname, :mobile])
  |> validate_required([:firstname, :lastname])
end 

def password_changeset(user, attrs) do
  user

  |> cast(attrs, [:password])
  |> validate_required([:password])
  |> validate_length(:password, min: 3) # password min length
  |> put_password_hash() # This is the missing link
end

def mfa_changeset(user, attrs) do
  user

  |> cast(attrs, [:secret, :qrcodeurl])
  |> validate_mfa_presence()
end

defp validate_mfa_presence(changeset) do
  # If we are explicitly setting secret to nil (disabling), skip validation.
  # Otherwise, ensure it's present.
  case get_field(changeset, :secret) do
    nil -> changeset
    _   -> validate_required(changeset, [:secret])
  end
end


 defp put_password_hash(changeset) do
    # Check if the password change exists and the changeset is valid
    case get_change(changeset, :password) do
      password when is_binary(password) ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end

end

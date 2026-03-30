##lib/elixir_graphql_mysql_web/graphql/types/loginuser_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.LoginuserInput do
  use Absinthe.Schema.Notation

  input_object :login_input do
    field :username, non_null(:string)
    field :password, non_null(:string)
  end

  object :login_response do
    field :token, :string
    field :message, :string
    field :user, :users
  end

  object :users do
    field :id, :id
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :mobile, :string
    field :username, :string
    field :isactivated, :boolean
    field :isblocked, :boolean
    field :mailtoken, :integer
    field :userpic, :string
    field :qrcodeurl, :string
  end
end

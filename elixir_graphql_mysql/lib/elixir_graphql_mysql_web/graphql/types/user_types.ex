# lib/elixir_graphql_mysql_web/graphql/types/user_types.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.UserTypes do

  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
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

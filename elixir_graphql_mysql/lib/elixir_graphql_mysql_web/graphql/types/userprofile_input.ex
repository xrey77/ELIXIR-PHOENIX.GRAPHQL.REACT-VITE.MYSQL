##lib/elixir_graphql_mysql_web/graphql/types/userprofile_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.UserprofileInput do
  use Absinthe.Schema.Notation

  input_object :user_profile_input do
    field :id, non_null(:integer)
    field :firstname, non_null(:string)
    field :lastname, non_null(:string)
    field :mobile, :string
  end

  object :userprofile_response do
    field :message, :string
  end

end



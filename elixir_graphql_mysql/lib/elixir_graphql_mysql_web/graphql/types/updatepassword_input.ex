##lib/elixir_graphql_mysql_web/graphql/types/updatepassword_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.UpdatePasswordInput do
  use Absinthe.Schema.Notation

  input_object :update_password_input do
    field :id, non_null(:integer)
    field :password, :string
  end

  object :updatepassword_response do
    field :message, :string
  end

end



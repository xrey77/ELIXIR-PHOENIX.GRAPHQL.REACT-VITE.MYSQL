##lib/elixir_graphql_mysql_web/graphql/types/activate_mfa_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.ActivateMfaInput do
  use Absinthe.Schema.Notation

  input_object :activatemfa_input do
    field :id, non_null(:integer)
    field :twofactorenabled, :boolean
  end

  object :activatemfa_response do
    field :qrcodeurl, :string
    field :message, :string
  end

end



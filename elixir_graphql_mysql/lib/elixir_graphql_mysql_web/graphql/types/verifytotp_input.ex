##lib/elixir_graphql_mysql_web/graphql/types/verifytotp_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.VerifytotpInput do
  use Absinthe.Schema.Notation

  input_object :verifytotp_input do
    field :id, non_null(:integer)
    field :otp, non_null(:string)
  end

  object :verifytotp_response do
    field :username, :string
    field :message, :string
  end

end



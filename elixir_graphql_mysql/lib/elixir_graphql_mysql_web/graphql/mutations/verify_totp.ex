# lib/elixir_graphql_mysql_web/graphql/mutations/verify_totp.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.VerifyTotp do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.VerifyTotpResolver, as: VerifyTotpResolver

  object :verifytotp_mutation do
    @desc "Veiry OTP code"
    field :verify_otp, :verifytotp_response do
      arg :input, non_null(:verifytotp_input)            
      resolve &VerifyTotpResolver.verify_otp/3
    end
  end
end


#====REQUEST=========
#mutation VerifyTotp($input: VerifytotpInput!) {
#    verifyOtp(input: $input) { 
#        username
#        message
#    }
#}

#=====VARIABLES======
#{
#    "input": {
#        "id": 1,
#        "otp": "3242344"
#    }
#}
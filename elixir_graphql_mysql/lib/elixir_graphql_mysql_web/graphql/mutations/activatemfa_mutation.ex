# lib/elixir_graphql_mysql_web/graphql/mutations/activatemfa_mutation.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.ActivatemfaMutation do
  use Absinthe.Schema.Notation

  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.ActivateMfa, as: ActivateMfaResolver


  object :activatemfa_mutation do
    @desc "MFA activation"
    field :activate_mfa, :activatemfa_response do
      arg :input, non_null(:activatemfa_input)            
      resolve &ActivateMfaResolver.activatemfa_resolver/3
    end
  end
end


#======REQUEST===============
#mutation ActivateMfa($input: ActivatemfaInput!) {
#    activateMfa(input: $input) {
#        qrcodeurl
#        message
#    }
#}

#======VARIABLES=============
#{
#    "input": {
#        "id": 1,
#        "twofactorenabled": false
#    }
#}
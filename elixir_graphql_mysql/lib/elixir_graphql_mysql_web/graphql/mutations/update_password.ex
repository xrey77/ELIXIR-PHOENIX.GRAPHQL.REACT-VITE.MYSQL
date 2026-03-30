# lib/elixir_graphql_mysql_web/graphql/mutations/update_password.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.UpdatePassword do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.UpdatePassword, as: UpdatePasswordResolver

  object :updatepassword_mutation do
    @desc "Change user password"
    field :update_password, :updatepassword_response do
      arg :input, non_null(:update_password_input)            
      resolve &UpdatePasswordResolver.update_password/3
    end
  end
end


#=====REQUEST========
#mutation LoginUser($input: LoginInput!) {    
#    loginUser(input: $input) {
#        token
#        message
#        user{
#            id
#            firstname
#            lastname
#            email
#            mobile
#            username          
#            isactivated
#            isblocked
#            mailtoken
#            userpic
#            qrcodeurl
#        }
#    }
#}

#=====VARIABLES==========
#{
#    "input": {
#        "id": 1,
#        "password": "nald"
#    }
#}
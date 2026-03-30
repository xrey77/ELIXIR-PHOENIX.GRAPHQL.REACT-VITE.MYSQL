# lib/elixir_graphql_mysql_web/graphql/mutations/login.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.Login do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.LoginUser, as: UserResolver

  object :login_mutation do
    @desc "User login"
    field :login_user, :login_response do
      arg :input, non_null(:login_input)            
      resolve &UserResolver.login_user/3
    end
  end
end


#====REQUEST=====
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


# ====VARIABLES===
#{
#    "input": {   
#        "username": "Rey",
#        "password": "rey"
#    }
#}
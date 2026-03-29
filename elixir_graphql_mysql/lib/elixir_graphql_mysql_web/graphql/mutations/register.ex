# lib/elixir_graphql_mysql_web/graphql/mutations/register.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.Register do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.Accounts, as: UserResolver

  object :register_mutation do
    @desc "Register a new user"
    field :register_user, :user_response do
      arg :input, non_null(:create_user_input)
            
      resolve &UserResolver.create_user/3
    end
  end
end

# ======REQUEST========
# mutation RegisterUser($input: CreateUserInput!) {
#     registerUser(input: $input) {
#         message
#         user {
#             id
#         }
#     }
    
# }
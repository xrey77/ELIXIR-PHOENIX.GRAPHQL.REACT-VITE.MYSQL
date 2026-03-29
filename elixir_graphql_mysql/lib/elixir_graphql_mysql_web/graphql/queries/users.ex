# lib/elixir_graphql_mysql_web/graphql/queries/users.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.Users do
  use Absinthe.Schema.Notation

  object :user_queries do
    @desc "Get all users"
    field :all_users, list_of(:user) do
      resolve &ElixirGraphqlMysqlWeb.Resolvers.Accounts.list_users/3
    end
  end
end


# ======REQUEST=====
# query Getusers{
#   allUsers{
#     id
#     firstname
#     lastname
#     email
#     mobile    
#     username
#     isactivated
#     isblocked
#     mailtoken
#     username
#     qrcodeurl
#   }
# }
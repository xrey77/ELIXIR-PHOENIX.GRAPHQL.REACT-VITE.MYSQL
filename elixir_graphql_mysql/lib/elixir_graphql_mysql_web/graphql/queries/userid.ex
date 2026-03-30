# lib/elixir_graphql_mysql_web/graphql/queries/userid.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Queries.Userid do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysql.Accounts 

  object :user_id_queries do
    @desc "Get a user by ID"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &find_user/3
    end
  end

  # Keep the resolver function (now referenced above)
  def find_user(_parent, %{id: id}, _resolution) do
    case Accounts.get_user(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end

#======REQUEST==========
#query GetUserId($id: ID!) {    
#    user(id: $id) {
#        id
#        firstname
#        lastname
#        email
#        mobile
#        username
#        isactivated
#        isblocked
#        mailtoken
#        userpic
#        qrcodeurl
#    }
#}

##lib/elixir_graphql_mysql_web/graphql/types/createuser_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.CreateuserInput do
  use Absinthe.Schema.Notation

  input_object :create_user_input do
    field :firstname, non_null(:string)
    field :lastname, non_null(:string)
    field :email, non_null(:string)
    field :mobile, :string
    field :username, non_null(:string)
    field :password, non_null(:string)
    field :secret, :string
    field :qrcodeurl, :string    
  end

  object :user_response do
  field :message, :string
  field :user, :user_register
end


  object :user_register do
    field :id, :id
  end
end


##lib/elixir_graphql_mysql_web/graphql/types/createuser_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.CreateuserInput do
  use Absinthe.Schema.Notation

  input_object :create_user_input do
    field :firstname, non_null(:string)
    field :lastname, non_null(:string)
    field :email, non_null(:string)
    field :mobile, :string
    field :username, non_null(:string)
    field :password, non_null(:string)
    field :secret, :string
    field :qrcodeurl, :string    
  end

  object :user_response do
  field :message, :string
  field :user, :user_register
end


  object :user_register do
    field :id, :id
  end
end



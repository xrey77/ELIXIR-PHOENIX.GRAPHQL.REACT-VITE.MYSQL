# lib/elixir_graphql_mysql_web/schema.ex
defmodule ElixirGraphqlMysqlWeb.Schema do
  use Absinthe.Schema

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UserTypes
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Users
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Userid

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.CreateuserInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.Register
  
  query do
    import_fields :user_queries
    import_fields :user_id_queries 
  end

  mutation do
    import_fields :register_mutation
  end

end
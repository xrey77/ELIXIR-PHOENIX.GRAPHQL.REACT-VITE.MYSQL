# lib/elixir_graphql_mysql_web/schema.ex
defmodule ElixirGraphqlMysqlWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Plug.Types
  
  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UserTypes
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Users
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Userid

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.PaginationType
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.ProductsList


  import_types ElixirGraphqlMysqlWeb.Graphql.Types.CreateuserInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.Register

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.LoginuserInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.Login

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UserprofileInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.UpdateProfile

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UpdatePasswordInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.UpdatePassword

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.ActivateMfaInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.ActivatemfaMutation

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UploadPictureInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.UploadPicture


  query do
    import_fields :user_queries
    import_fields :user_id_queries 
    import_fields :products_list
  end

  mutation do
    import_fields :register_mutation
    import_fields :login_mutation
    import_fields :updateprofile_mutation
    import_fields :updatepassword_mutation
    import_fields :activatemfa_mutation
    import_fields :uploadpicture_mutation
  end

end
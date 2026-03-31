# lib/elixir_graphql_mysql_web/schema.ex
defmodule ElixirGraphqlMysqlWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Plug.Types
  
  import_types ElixirGraphqlMysqlWeb.Graphql.Types.UserTypes
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Users
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.Userid

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.PaginationType
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.ProductsList

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.ProductPageInfo
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.ProductsSearch

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.SalesTypes
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.SalesQuery

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.ProductsType
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.ProductReport

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.CategoryType
  import_types ElixirGraphqlMysqlWeb.Graphql.Queries.ProductCategory



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

  import_types ElixirGraphqlMysqlWeb.Graphql.Types.VerifytotpInput
  import_types ElixirGraphqlMysqlWeb.Graphql.Mutations.VerifyTotp

  query do
    import_fields :user_queries
    import_fields :user_id_queries 
    import_fields :products_list
    import_fields :products_search_queries
    import_fields :sales_queries
    import_fields :product_report
    import_fields :product_category_queries
  end

  mutation do
    import_fields :register_mutation
    import_fields :login_mutation
    import_fields :updateprofile_mutation
    import_fields :updatepassword_mutation
    import_fields :activatemfa_mutation
    import_fields :uploadpicture_mutation
    import_fields :verifytotp_mutation
  end

end
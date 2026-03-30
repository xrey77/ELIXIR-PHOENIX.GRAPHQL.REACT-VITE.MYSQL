##lib/elixir_graphql_mysql_web/graphql/types/uploadpicture_input.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Types.UploadPictureInput do
  use Absinthe.Schema.Notation

  input_object :uploadpicture_input do
    field :id, non_null(:integer)
    field :file, non_null(:upload)
  end

  object :uploadpicture_response do
    field :userpic, :string
    field :message, :string
  end

end



# lib/elixir_graphql_mysql_web/graphql/mutations/upload_picture.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.UploadPicture do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.UploadPicture, as: UploadPictureResolver

  object :uploadpicture_mutation do
    @desc "Upload profile picture"
    field :upload_picture, :uploadpicture_response do
      arg :input, non_null(:uploadpicture_input)            
      resolve &UploadPictureResolver.upload_picture/3
    end
  end
end


#====REQUEST=======
#mutation UploadPicture($input: UploadpictureInput!) {
#    uploadPicture(input: $input {
#        userpic
#        message
#    }
#}
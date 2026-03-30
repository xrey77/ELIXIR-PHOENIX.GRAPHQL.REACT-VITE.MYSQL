# lib/elixir_graphql_mysql_web/graphql/mutations/update_profile.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Mutations.UpdateProfile do
  use Absinthe.Schema.Notation
  alias ElixirGraphqlMysqlWeb.Graphql.Resolvers.UpdateProfile, as: UpdateProfileResolver

  object :updateprofile_mutation do
    @desc "Upate user profile"
    field :update_profile, :userprofile_response do
      arg :input, non_null(:user_profile_input)            
      resolve &UpdateProfileResolver.update_profile/3
    end
  end
end


#REQUEST
#mutation UpdateProfile($input: UserProfileInput!) {
#    updateProfile(input: $input) {
#        message
#    }
#}

#VARIABLES
#{
#    "input": {
#        "id": 1,
#        "firstname": "Reynaldos",
#        "lastname": "Marquez-Gragasin",
#        "mobile": "+6334234234"
#    }
#}
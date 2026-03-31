# lib/elixir_graphql_mysql_web/graphql/resolvers/verifytotp_resolver.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.VerifyTotpResolver do
    alias ElixirGraphqlMysql.Accounts

    def verify_otp(_parent, %{input: input}, _resolution) do
    case Accounts.get_user(input.id) do
        nil ->
        {:error, message: "User ID not found.", code: :not_found}

        user ->
        # Check if the secret exists and is not nil
        if user.secret do
            if NimbleTOTP.valid?(user.secret, input.otp) do
            {:ok, %{username: user.username, message: "Successful OTP validation."}}
            else
            {:error, message: "OTP code is not valid.", code: :unauthorized}
            end
        else
            {:error, message: "MFA is not yet enabled.", code: :bad_request}
        end
    end
    end


end

# lib/elixir_graphql_mysql_web/graphql/resolvers/activatemfa.ex
defmodule ElixirGraphqlMysqlWeb.Graphql.Resolvers.ActivateMfa do
    alias ElixirGraphqlMysql.Accounts

    def activatemfa_resolver(_parent, %{input: input}, _resolution) do
    case Accounts.get_user(input.id) do
        nil -> 
        {:error, "User ID not found."}

        user ->
        if input[:twofactorenabled] do
            secret = NimbleTOTP.secret()
            encoded_secret = Base.encode64(secret)

            otpauth_uri = NimbleTOTP.otpauth_uri(user.email, encoded_secret, issuer: "WORLD BANK")

            qr_code_base64 = 
            otpauth_uri

            |> EQRCode.encode()
            |> EQRCode.png()
            |> Base.encode64()

            # Prepare the attributes for update
            attrs = %{
            secret: encoded_secret, 
            qrcodeurl: "data:image/png;base64,#{qr_code_base64}"
            }

            # Call update and handle the result
            case Accounts.update_mfa(user, attrs) do
            {:ok, _updated_user} ->
                {:ok, %{
                qrcodeurl: "data:image/png;base64,#{qr_code_base64}",
                message: "MFA is enabled successfully"
                }}
            {:error, changeset} ->
                {:error, "Update failed: #{inspect(traverse_errors(changeset))}"}
            end

        else
            # Disable MFA logic
            attrs = %{secret: nil, qrcodeurl: nil}

            case Accounts.update_mfa(user, attrs) do
                {:ok, _updated_user} ->
                    {:ok, %{qrcodeurl: nil, message: "MFA is disabled successfully"}}
                {:error, changeset} ->
                    # Change this line to see the real error
                    {:error, "Disable failed: #{inspect(traverse_errors(changeset))}"}          
            end
        end
    end
    end

    defp traverse_errors(changeset) do
     Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
        end)
     end)
    end

end

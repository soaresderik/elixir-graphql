defmodule TodoAppWeb.Schema.AuthTypes do
  use Absinthe.Schema.Notation

  alias TodoApp.ErrorHandling

  object :sign_up do
    field :sign_up, :boolean do
      arg(:username, :string)
      arg(:password, :string)

      resolve(fn _, args, _ ->
        case TodoApp.Services.Auth.sign_up(args) do
          {:ok, _} -> {:ok, true}
          {:error, result} -> {:error, ErrorHandling.extract_error_msg(result)}
        end
      end)
    end
  end

  object :login do
    field :login, :auth do
      arg(:username, :string)
      arg(:password, :string)

      resolve(fn _, args, _ ->
        case TodoApp.Services.Auth.login(args) do
          {:ok, auth} -> {:ok, auth}
          {:error, result} -> {:error, ErrorHandling.extract_error_msg(result)}
        end
      end)
    end
  end

  object :auth do
    field :token, :string
  end
end

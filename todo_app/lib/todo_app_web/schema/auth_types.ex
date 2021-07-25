defmodule TodoAppWeb.Schema.AuthTypes do
  use Absinthe.Schema.Notation

  object :sign_up do
    field :sign_up, :boolean do
      arg(:username, :string)
      arg(:password, :string)

      resolve(fn _, _, _ ->
        {:ok, true}
      end)
    end
  end

  object :login do
    field :login, :boolean do
      arg(:username, :string)
      arg(:password, :string)

      resolve(fn _, _, _ ->
        {:ok, true}
      end)
    end
  end
end

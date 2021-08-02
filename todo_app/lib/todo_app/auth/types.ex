defmodule TodoApp.Auth.Types do
  use Absinthe.Schema.Notation

  alias TodoApp.Auth.Resolvers, as: AuthResolvers

  object :auth_mutations do
    field :sign_up, :boolean do
      arg(:username, :string)
      arg(:password, :string)

      resolve(&AuthResolvers.sign_up/3)
    end

    field :login, :auth do
      arg(:username, :string)
      arg(:password, :string)

      resolve(&AuthResolvers.login/3)
    end
  end

  object :auth do
    field :token, :string
  end
end

defmodule TodoApp.User.Types do
  use Absinthe.Schema.Notation
  alias TodoApp.Todos.Resolvers, as: TodosResolvers
  alias TodoApp.User.Resolvers, as: UserResolvers

  object :user_queries do
    field :me, :user do
      resolve(&UserResolvers.get_user/3)
    end
  end

  object :user do
    field :id, :string
    field :username, :string

    field :todos, list_of(:todo) do
      arg(:page, :integer)
      arg(:size, :integer)

      resolve(&TodosResolvers.list/3)
    end
  end
end

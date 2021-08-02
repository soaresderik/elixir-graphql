defmodule TodoApp.Todos.Types do
  import TodoApp.Shared.FieldRenamer

  use Absinthe.Schema.Notation
  alias TodoApp.Todos.Resolvers, as: TodosResolvers

  object :todo_queries do
    @desc "Get all todo list"
    field :todos, list_of(:todo) do
      arg(:page, :integer)
      arg(:size, :integer)

      resolve(&TodosResolvers.list/3)
    end
  end

  object :todo_mutations do
    field :create_todo, type: :todo do
      arg(:title, non_null(:string))
      arg(:description, non_null(:string))

      resolve(&TodosResolvers.create_task/3)
    end
  end

  object :todo do
    field :id, :id
    field :title, :string
    field :description, :string
    field :done, :boolean
    field :created_at, :string, resolve: rename(:inserted_at)

    field :owner, :user, resolve: rename(:user)
  end
end

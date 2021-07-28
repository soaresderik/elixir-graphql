defmodule TodoApp.Todos.Types do
  use Absinthe.Schema.Notation
  alias TodoApp.Structs.Paginate
  alias TodoApp.Todos.Resolvers, as: TodosResolvers
  alias TodoApp.Todos.Services, as: TodosServices

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

    field :owner, :user do
      resolve(fn _, _, _ ->
        {:ok, true}
      end)
    end
  end

  object :user do
    field :id, :id
    field :username, :string

    field :todos, list_of(:todo) do
      arg(:page, :integer)
      arg(:size, :integer)

      resolve(fn _, args, _ ->
        args =
          %Paginate{}
          |> struct(args)

        {:ok, TodosServices.list(args)}
      end)
    end
  end
end

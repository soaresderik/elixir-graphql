defmodule TodoAppWeb.Schema do
  use Absinthe.Schema
  alias TodoApp.Resolvers

  import_types(TodoAppWeb.Schema.ContentTypes)
  import_types(TodoAppWeb.Schema.AuthTypes)

  query do
    @desc "Get all todo list"
    field :todos, list_of(:todo) do
      arg(:page, :integer)
      arg(:size, :integer)

      resolve(&Resolvers.Todo.list/3)
    end
  end

  mutation do
    @desc "Create a new todo"
    field :create_todo, type: :todo do
      arg(:title, non_null(:string))
      arg(:description, non_null(:string))

      resolve(fn _, args, _ ->
        {:ok, TodoApp.Services.Todo.create_task(args)}
      end)
    end

    import_fields(:sign_up)
    import_fields(:login)
  end
end

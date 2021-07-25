defmodule TodoAppWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias TodoApp.Structs.Paginate

  object :todo do
    field :id, :id
    field :title, :string
    field :description, :string
    field :done, :boolean

    field :owner, :user do
      resolve(fn _, _, _ ->
        {:ok, TodoApp.Services.User.list()}
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

        {:ok, TodoApp.Services.Todo.list(args)}
      end)
    end
  end
end

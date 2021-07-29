defmodule TodoApp.Todo.Entity do
  use TodoApp.BaseSchema

  import Ecto.Changeset

  schema "todos" do
    field :title, :string
    field :description, :string
    field :done, :boolean

    belongs_to :user, TodoApp.User.Entity

    timestamps()
  end

  def changeset(todo, attrs \\ %{}) do
    todo
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end

defmodule TodoApp.Repository.Todo do
  use Ecto.Schema, warn: false

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "todos" do
    field :title, :string
    field :description, :string
    field :done, :boolean

    timestamps()
  end

  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end

  import Ecto.Changeset
end

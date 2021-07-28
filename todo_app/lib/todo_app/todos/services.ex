defmodule TodoApp.Todos.Services do
  import Ecto.Query

  alias TodoApp.Todo.Entity, as: TodoEntity
  alias TodoApp.Repo

  def list(%{page: page, size: size}) do
    TodoEntity
    |> select([:title, :description, :done, :id])
    |> limit(^size)
    |> offset(^((page - 1) * size))
    |> Repo.all()
  end

  def create_task(%{title: title, description: description}) do
    Repo.insert!(%TodoEntity{title: title, description: description})
  end
end

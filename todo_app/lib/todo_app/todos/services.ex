defmodule TodoApp.Todos.Services do
  import Ecto.Query

  alias TodoApp.Todo.Entity, as: TodoEntity
  alias TodoApp.Repo

  def list(%{page: page, size: size}) do
    todos =
      TodoEntity
      |> preload(:user)
      |> select([todo], todo)
      |> join(:inner, [todo], user in assoc(todo, :user))
      |> limit(^size)
      |> offset((^page - 1) * ^size)
      |> Repo.all()

    {:ok, todos}
  end

  def create_task(%{title: title, description: description, user: user}) do
    Repo.insert!(%TodoEntity{title: title, description: description, user: user})
  end
end

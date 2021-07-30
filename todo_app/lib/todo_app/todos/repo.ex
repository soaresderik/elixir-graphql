defmodule TodoApp.Todos.Repo do
  import Ecto.Query

  import TodoApp.Shared.Paginate
  alias TodoApp.Todo.Entity, as: TodoEntity
  alias TodoApp.Repo

  def query_list(%{size: size, page: page}) do
    TodoEntity
    |> preload(:user)
    |> select([todo], todo)
    |> join(:inner, [todo], user in assoc(todo, :user))
    |> paginate(page, size)
  end

  def list(:list_all_tasks, args) do
    query_list(args)
    |> Repo.all()
  end

  def list(:current_user_access, args) do
    query_list(args)
    |> where([..., user], user.id == ^args.user_id)
    |> Repo.all()
  end
end

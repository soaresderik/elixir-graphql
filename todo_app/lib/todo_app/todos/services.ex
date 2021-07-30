defmodule TodoApp.Todos.Services do
  alias TodoApp.Todo.Entity, as: TodoEntity
  alias TodoApp.Todos.Repo, as: TodoRepo
  alias TodoApp.Repo

  def list(permission, args) do
    TodoRepo.list(permission, %{page: args.page, size: args.size, user_id: args.user.id})
  end

  def create_task(:create_task, %{title: title, description: description, user: user}) do
    Repo.insert!(%TodoEntity{title: title, description: description, user: user})
  end
end

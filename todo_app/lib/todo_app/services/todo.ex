defmodule TodoApp.Services.Todo do
  import Ecto.Query

  alias TodoApp.Repository.Todo
  alias TodoApp.Repo

  def list(%{page: page, size: size}) do
    Todo
    |> select([:title, :description, :done, :id])
    |> limit(^size)
    |> offset(^((page - 1) * size))
    |> Repo.all()
  end

  def create_task(%{title: title, description: description}) do
    Repo.insert!(%Todo{title: title, description: description})
  end
end

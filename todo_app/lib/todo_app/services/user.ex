defmodule TodoApp.Services.User do
  import Ecto.Query

  alias TodoApp.Repo
  alias TodoApp.Repository.User

  def list() do
    user = %{id: "#01", username: "André Soares"}

    user
  end

  def get_by(:id, id) do
    case Repo.get(User, id) do
      nil -> {:error, [:user, "User not found"]}
      user -> {:ok, user}
    end
  end

  def get_by(:username, username) do
    case Repo.get_by(User, username: username) do
      nil -> {:error, [:user, "User not found"]}
      user -> {:ok, user}
    end
  end
end

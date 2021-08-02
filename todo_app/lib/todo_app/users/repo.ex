defmodule TodoApp.User.Repo do
  alias TodoApp.Repo
  alias TodoApp.User.Entity, as: UserEntity

  def list() do
    user = %{id: "#01", username: "André Soares"}

    user
  end

  def get_by(key, value) do
    params = Keyword.put([], key, value)

    case Repo.get_by(UserEntity, params) do
      nil -> {:error, [:user, "User not found"]}
      user -> {:ok, user}
    end
  end

  def get_by!(:id, id) do
    case Repo.get(UserEntity, id) do
      nil -> [:user, "User not found"]
      user -> user
    end
  end
end

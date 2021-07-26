defmodule TodoApp.Services.Auth do
  import Ecto.Query

  alias TodoApp.Repository.User
  alias TodoApp.Repo

  def sign_up(args) do
    args
    |> User.changeset()
    |> Repo.insert()
    |> handle_auth()
  end

  def login(args) do
    User
    |> select([:username, :password])
    |> where(username: ^args.username)
    |> where(password: ^args.password)
    |> Repo.one()
    |> handle_auth
  end

  def handle_auth(%User{} = _), do: {:ok, true}
  def handle_auth({:ok, %User{}} = _), do: {:ok, true}
  def handle_auth({:error, result}), do: {:error, result}
end

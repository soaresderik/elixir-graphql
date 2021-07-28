defmodule TodoApp.Auth.Services do
  # import Ecto.Query

  alias TodoApp.User.Entity, as: UserEntity
  alias TodoApp.Repo
  alias TodoApp.Guardian

  def sign_up(args) do
    args
    |> UserEntity.changeset()
    |> Repo.insert()
    |> handle_auth()
  end

  def login(args) do
    with {:ok, token} <-
           Guardian.authenticate(%{username: args.username, password: args.password}) do
      {:ok, %{token: token}}
    else
      _ -> handle_auth(nil)
    end
  end

  def handle_auth(%UserEntity{} = _), do: {:ok, true}
  def handle_auth({:ok, %UserEntity{}} = _), do: {:ok, true}
  def handle_auth({:error, result}), do: {:error, result}
  def handle_auth(_), do: {:error, [:login, "Username or password are incorrect."]}
end

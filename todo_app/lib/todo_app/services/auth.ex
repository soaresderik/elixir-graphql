defmodule TodoApp.Services.Auth do
  # import Ecto.Query

  alias TodoApp.Repository.User
  alias TodoApp.Repo
  alias TodoApp.Guardian

  def sign_up(args) do
    args
    |> User.changeset()
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

  def handle_auth(%User{} = _), do: {:ok, true}
  def handle_auth({:ok, %User{}} = _), do: {:ok, true}
  def handle_auth({:error, result}), do: {:error, result}
  def handle_auth(_), do: {:error, [:login, "Username or password are incorrect."]}
end

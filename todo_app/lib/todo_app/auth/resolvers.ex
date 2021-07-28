defmodule TodoApp.Auth.Resolvers do
  alias TodoApp.ErrorHandler

  def sign_up(_, args, _) do
    case TodoApp.Auth.Services.sign_up(args) do
      {:ok, _} -> {:ok, true}
      {:error, result} -> {:error, ErrorHandler.parse(result)}
    end
  end

  def login(_, args, _) do
    case TodoApp.Auth.Services.login(args) do
      {:ok, auth} -> {:ok, auth}
      {:error, result} -> {:error, ErrorHandler.parse(result)}
    end
  end
end

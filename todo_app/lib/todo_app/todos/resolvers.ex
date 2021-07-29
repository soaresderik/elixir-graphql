defmodule TodoApp.Todos.Resolvers do
  alias TodoApp.Structs.Paginate
  alias TodoApp.ErrorHandler
  alias TodoApp.Todos.Services, as: TodosServices

  def list(_, args, %{context: %{current_user: _}}) do
    args =
      %Paginate{}
      |> struct(args)

    case TodosServices.list(args) do
      {:ok, todos} -> {:ok, todos}
      {:error, result} -> {:ok, ErrorHandler.parse(result)}
    end
  end

  def list(_, _, _),
    do: {:error, ErrorHandler.parse([:unauthorized, "Not Authorized"])}

  def create_task(_, args, %{context: %{current_user: user}}) do
    args = Map.put_new(args, :user, user)
    {:ok, TodosServices.create_task(args)}
  end

  def create_task(_, _, _),
    do: {:error, ErrorHandler.parse([:unauthorized, "Not Authorized"])}
end

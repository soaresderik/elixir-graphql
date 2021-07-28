defmodule TodoApp.Todos.Resolvers do
  alias TodoApp.Structs.Paginate
  alias TodoApp.ErrorHandler
  alias TodoApp.Todos.Services, as: TodosServices

  def list(_, args, %{context: %{current_user: _}}) do
    args =
      %Paginate{}
      |> struct(args)

    {:ok, TodosServices.list(args)}
  end

  def list(_, _args, _),
    do: {:error, ErrorHandler.parse([:unauthorized, "Not Authorized"])}

  def create_task(_, args, _) do
    {:ok, TodosServices.create_task(args)}
  end
end

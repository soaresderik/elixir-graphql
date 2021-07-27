defmodule TodoApp.Resolvers.Todo do
  alias TodoApp.Structs.Paginate
  alias TodoApp.ErrorHandling

  def list(_, args, %{context: %{current_user: _}}) do
    args =
      %Paginate{}
      |> struct(args)

    {:ok, TodoApp.Services.Todo.list(args)}
  end

  def list(_, _args, _),
    do: {:error, ErrorHandling.extract_error_msg([:unauthorized, "Not Authorized"])}
end

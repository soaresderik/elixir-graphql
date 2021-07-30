defmodule TodoApp.Todos.Resolvers do
  alias TodoApp.Shared.Permissions
  alias TodoApp.Structs.Paginate
  alias TodoApp.ErrorHandler
  alias TodoApp.Todos.Services, as: TodosServices

  def list(_, args, %{context: %{current_user: user}}) do
    args =
      %Paginate{}
      |> struct(args)

    args = Map.put_new(args, :user, user)

    params = %Permissions{
      allowed: nil,
      user: user,
      params: args,
      callback: &TodosServices.list/2
    }

    cond do
      :list_all_tasks in user.permissions ->
        Permissions.check_permission(%{params | allowed: :list_all_tasks})

      :current_user_access in user.permissions ->
        Permissions.check_permission(%{params | allowed: :current_user_access})

      true ->
        {:error, ErrorHandler.parse([:unauthorized, "Not Allowed"])}
    end
  end

  def list(_, _, _),
    do: {:error, ErrorHandler.parse([:unauthorized, "Not Authorized"])}

  def create_task(_, args, %{context: %{current_user: user}}) do
    args = Map.put_new(args, :user, user)

    Permissions.check_permission(%Permissions{
      allowed: :create_task,
      user: user,
      params: args,
      callback: &TodosServices.create_task/2
    })
  end

  def create_task(_, _, _),
    do: {:error, ErrorHandler.parse([:unauthorized, "Not Authorized"])}
end

defmodule TodoApp.Shared.Permissions do
  alias TodoApp.ErrorHandler
  alias TodoApp.Shared.Permissions
  defstruct [:allowed, :user, :callback, :params]

  @permissions [:create_task, :list_all_tasks, :current_user_access]

  def check_permission(%Permissions{} = args) do
    with true <- args.allowed in Permissions.permissions(),
         true <- args.allowed in args.user.permissions,
         result <- args.callback.(args.allowed, args.params) do
      {:ok, result}
    else
      {:error, message} -> {:error, ErrorHandler.parse(message)}
      _ -> {:error, ErrorHandler.parse([:unauthorized, "Access not allowed."])}
    end
  end

  def permissions, do: @permissions
end

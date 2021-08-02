defmodule TodoApp.User.Resolvers do
  alias TodoApp.User.Repo, as: UserRepo

  def get_user(_, _, %{context: %{current_user: user}}) do
    UserRepo.get_by(:id, user.id)
  end
end

defmodule TodoApp.Guardian do
  use Guardian, otp_app: :todo_app
  alias TodoApp.Services.User

  def resource_from_claims(%{"sub" => id}) do
    user = User.get_by(:id, id)
    {:ok, user}
  rescue
    Ecto.NoResultsError -> {:error, :resource_not_found}
  end

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def authenticate(%{username: username, password: password}) do
    with {:ok, %{password: hash} = user} <- User.get_by(:username, username),
         true <- Bcrypt.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, [:unauthorized, "Please verify your credentials"]}
      _ -> {:error, [:unauthorized, "Please verify your credentials"]}
    end
  end

  def authenticate(_), do: {:error, [:bad_request, "Invalid or missing params"]}
end

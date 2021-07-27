defmodule TodoApp.Repository.User do
  use Ecto.Schema, warn: false

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:username, :password]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "users" do
    field :username, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:username, ~r/^[a-z0-9.\_\-]+$/)
    |> unique_constraint(:username)
    |> update_change(:password, &Bcrypt.hash_pwd_salt/1)
  end
end

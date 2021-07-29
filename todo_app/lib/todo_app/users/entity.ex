defmodule TodoApp.User.Entity do
  use TodoApp.BaseSchema

  import Ecto.Changeset

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

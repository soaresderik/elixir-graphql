defmodule TodoApp.Repo.Migrations.Users do
  use Ecto.Migration

  def up do
    create table(:users) do
        add :username, :string, unique: true
        add :password, :string

        timestamps()
    end

    create unique_index(:users, [:username])
  end

  def down do
    drop_if_exists table(:users)
  end
end

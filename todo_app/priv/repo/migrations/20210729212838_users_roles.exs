defmodule TodoApp.Repo.Migrations.UsersRoles do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add_if_not_exists :permissions, :json
    end
  end

  def down do
    alter table(:users) do
      remove :permissions
    end
  end
end

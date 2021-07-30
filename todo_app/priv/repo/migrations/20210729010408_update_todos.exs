defmodule TodoApp.Repo.Migrations.UpdateTodos do
  use Ecto.Migration

  def up do
    alter table(:todos) do
      add_if_not_exists :user_id, references(:users)
    end
  end

  def down do
    alter table(:todos) do
      remove :user_id
    end
  end
end

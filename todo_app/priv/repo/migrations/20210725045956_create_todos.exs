defmodule TodoApp.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def up do
    create table(:todos) do
      add :title, :string
      add :description, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end

  def down do
    drop_if_exists table(:todos)
  end
end
